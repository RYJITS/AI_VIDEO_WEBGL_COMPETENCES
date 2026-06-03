# Gestion des echecs de sortie Mistral

Ce document decrit les strategies de recuperation lorsque les sorties generees par Mistral (ou d'autres modeles d'IA) sont tronquees, malformees, non-ASCII, trop larges ou non applicables au depot **AI_VIDEO_WEBGL_COMPETENCES**. Ces situations peuvent survenir lors de la generation de code, de documentation, de workflows ComfyUI ou d'exemples techniques.

---

## Table des matieres
1. [Cas d'echec courants](#cas-d'echec-courants)
2. [Procedures de recuperation](#procedures-de-recuperation)
3. [Validation des sorties](#validation-des-sorties)
4. [Bonnes pratiques pour eviter les echecs](#bonnes-pratiques-pour-eviter-les-echecs)
5. [Exemples concrets](#exemples-concrets)
6. [Ressources utiles](#ressources-utiles)
7. [Annexe : Foire aux questions](#annexe--foire-aux-questions)

---

## Cas d'echec courants

### 1. Sortie tronquee
**Description** : La sortie generee par Mistral est incomplete (ex: code coupe, documentation incomplete, workflow JSON invalide).
**Exemples** :
- Un script Python genere s'arrete au milieu d'une fonction.
- Une documentation technique manque des sections cles.
- Un workflow ComfyUI JSON est incomplet ou mal ferme.

**Causes possibles** :
- Limite de contexte atteinte (token limit).
- Erreur interne du modele.
- Probleme de streaming ou de generation.

---

### 2. Sortie malformee
**Description** : La sortie ne respecte pas la syntaxe attendue (ex: JSON invalide, code Python avec des erreurs de syntaxe, Markdown mal structure).
**Exemples** :
- Un fichier `.json` pour un workflow ComfyUI contient des virgules en trop ou des guillemets manquants.
- Un script genere utilise des mots-cles Python non valides (ex: `def` mal orthographie).
- Une documentation en Markdown a des titres desequilibres (`#` vs `##`).

**Causes possibles** :
- Mauvaise interpretation de la demande par Mistral.
- Conflit entre le format attendu et le format genere.
- Probleme de parsing cote client.

---

### 3. Sortie non-ASCII ou encodage incorrect
**Description** : La sortie contient des caracteres non-ASCII (ex: emojis, caracteres speciaux) ou un encodage incorrect (ex: UTF-8 vs ISO-8859-1).
**Exemples** :
- Un script genere contient des caracteres chinois ou arabes dans des noms de variables.
- Une documentation a des accents mal encodes (ex: `e` affiche comme `A`).

**Causes possibles** :
- Le modele genere du texte dans une langue non demandee.
- Probleme de configuration locale ou de terminal.

---

### 4. Sortie trop large ou hors sujet
**Description** : La sortie est excessivement longue, contient des informations non pertinentes ou depasse le cadre du depot.
**Exemples** :
- Un exemple de code genere 500 lignes de commentaires inutiles.
- Une documentation inclut des details sur des outils externes non utilises dans le projet.
- Un workflow ComfyUI inclut des nuds pour des modeles non supportes.

**Causes possibles** :
- Prompt trop vague ou mal formule.
- Le modele interprete mal les contraintes de taille.

---

### 5. Sortie non applicable au depot
**Description** : La sortie generee ne correspond pas au contexte du projet **AI_VIDEO_WEBGL_COMPETENCES** (ex: code pour un autre framework, documentation pour un outil non utilise).
**Exemples** :
- Un script genere utilise des bibliotheques non installees dans le projet (ex: `TensorFlow` alors que le projet utilise `PyTorch`).
- Une documentation decrit un workflow pour Blender alors que le projet utilise ComfyUI.

**Causes possibles** :
- Le prompt ne precise pas suffisamment le contexte technique.
- Le modele n'a pas acces aux informations specifiques au projet.

---

## Procedures de recuperation

### 1. Pour les sorties tronquees

#### a. Relancer la generation avec un prompt ajuste
- **Action** : Reformuler le prompt pour inclure des contraintes de taille ou des instructions explicites.
  **Exemple** :
  ```
  "Genere un script Python complet pour convertir une video en WebGL, avec une fonction `convert_to_webgl()` bien documentee. Limite la sortie a 200 lignes maximum."
  ```
- **Validation** : Verifier que la sortie est complete et coherente.

#### b. Utiliser un outil de validation
- **Outils** :
  - Pour le code : `python -m py_compile` (Python), `eslint` (JavaScript).
  - Pour le JSON : `jq empty` ou un validateur en ligne.
  - Pour le Markdown : `markdownlint` ou un editeur comme VS Code.
- **Commande** :
  ```bash
  python -m py_compile mon_script.py
  ```

#### c. Completer manuellement
- **Action** : Si la sortie est partiellement utilisable, la completer en suivant les bonnes pratiques du projet.
- **Exemple** : Ajouter les imports manquants ou fermer les accolades JSON.

---

### 2. Pour les sorties malformees

#### a. Corriger la syntaxe
- **Outils** :
  - Pour le JSON : `jq` ou un editeur JSON.
  - Pour le Python : `black` ou `autopep8`.
  - Pour le Markdown : un editeur comme Typora ou VS Code.
- **Commande** :
  ```bash
  jq '.' mon_workflow.json > mon_workflow_valide.json
  ```

#### b. Reformuler le prompt
- **Exemple** :
  ```
  "Genere un workflow ComfyUI JSON valide pour un pipeline de traitement video. Utilise uniquement les nuds disponibles dans ComfyUI. Structure le JSON avec des sauts de ligne pour une meilleure lisibilite."
  ```

---

### 3. Pour les sorties non-ASCII

#### a. Nettoyer le texte
- **Outils** :
  - `iconv` pour convertir l'encodage.
  - `sed` pour supprimer les caracteres non-ASCII.
- **Commande** :
  ```bash
  iconv -f UTF-8 -t ASCII//TRANSLIT mon_fichier.txt > mon_fichier_ascii.txt
  ```

#### b. Reformuler le prompt
- **Exemple** :
  ```
  "Genere une documentation technique en francais, sans caracteres speciaux ni emojis. Utilise uniquement des accents standard (e, e, e, c)."
  ```

---

### 4. Pour les sorties trop larges

#### a. Limiter la taille dans le prompt
- **Exemple** :
  ```
  "Genere un exemple de code Python pour traiter une video avec WebGL. Limite la sortie a 150 lignes et inclut uniquement les fonctions essentielles."
  ```

#### b. Utiliser des outils de decoupage
- **Outils** :
  - `head` pour extraire les N premieres lignes.
  - `tail` pour extraire les N dernieres lignes.
- **Commande** :
  ```bash
  head -n 150 mon_script.py > mon_script_limite.py
  ```

---

### 5. Pour les sorties non applicables

#### a. Preciser le contexte dans le prompt
- **Exemple** :
  ```
  "Genere un workflow ComfyUI pour un pipeline de traitement video utilisant des nuds standard (ex: Load Video, VAE Encode, KSampler). Ne pas inclure de nuds pour des modeles externes comme Stable Diffusion."
  ```

#### b. Verifier les dependances
- **Action** : S'assurer que les bibliotheques ou outils mentionnes dans la sortie sont compatibles avec le projet.
- **Commande** :
  ```bash
  pip list | grep tensorflow
  ```

---

## Validation des sorties

### 1. Verification automatique
| Type de sortie       | Outil de validation          | Commande exemple                     |
|----------------------|------------------------------|---------------------------------------|
| Code Python          | `py_compile`, `flake8`       | `python -m py_compile mon_script.py`  |
| JSON                 | `jq`, `jsonlint`             | `jq empty mon_workflow.json`          |
| Markdown             | `markdownlint`, `vscode`     | `markdownlint mon_doc.md`             |
| Workflow ComfyUI     | Validation via ComfyUI       | Importer le JSON dans ComfyUI         |

### 2. Verification manuelle
- **Pour le code** :
  - Les fonctions sont-elles bien documentees ?
  - Les imports sont-ils corrects ?
  - Le code est-il compatible avec les versions des outils du projet ?
- **Pour la documentation** :
  - Les titres sont-ils hierarchises correctement ?
  - Les exemples de code sont-ils executables ?
- **Pour les workflows** :
  - Tous les nuds sont-ils connectes ?
  - Les chemins de fichiers sont-ils valides ?

---

## Bonnes pratiques pour eviter les echecs

### 1. Rediger des prompts precis
- **A faire** :
  - Specifier le langage (Python, JSON, Markdown).
  - Definir des contraintes de taille (ex: "100 lignes maximum").
  - Preciser le contexte technique (ex: "pour ComfyUI 0.9.x").
  - Exclure les elements non pertinents (ex: "ne pas inclure de code pour TensorFlow").
- **Exemple** :
  ```
  "Genere un script Python pour convertir une video en WebGL en utilisant uniquement les bibliotheques OpenCV et WebGL. Limite a 80 lignes et inclut des commentaires en francais."
  ```

### 2. Utiliser des templates
- **Pour les workflows ComfyUI** :
  - Partir d'un template existant dans le depot (ex: `docs/COMFYUI_SETUP_CHECKLIST.md`).
  - Utiliser des nuds standard pour eviter les incompatibilites.
- **Pour la documentation** :
  - Suivre le style des fichiers existants (ex: `docs/FAQ.md`).

### 3. Tester les sorties generees
- **Pour le code** :
  - Executer le script dans un environnement isole.
  - Verifier les logs et les erreurs.
- **Pour les workflows** :
  - Importer le JSON dans ComfyUI et verifier les connexions.
- **Pour la documentation** :
  - Previsualiser le Markdown dans un editeur ou un navigateur.

### 4. Limiter les risques de non-ASCII
- **A faire** :
  - Specifier dans le prompt : "Utilise uniquement des caracteres ASCII ou des accents francais standard (e, e, e, c)."
  - Configurer l'encodage du terminal en UTF-8.
- **Commande** :
  ```bash
  chcp 65001  # Windows : passer en UTF-8
  ```

---

## Exemples concrets

### Exemple 1 : Workflow ComfyUI malforme
**Prompt initial** :
```
Genere un workflow ComfyUI pour un pipeline de traitement video.
```

**Sortie generee** :
```json
{
  "nodes": [
    {
      "id": 1,
      "type": "LoadVideo",
      "inputs": {
        "video_path": "input.mp4"
      }
    },
    {
      "id": 2,
      "type": "VAEEncode",
      "inputs": {
        "latent": "latent_image"
      }
    }
  ]
```  # Invalide : accolade manquante
```

**Solution** :
1. Corriger la syntaxe avec `jq` :
   ```bash
   echo '{"nodes": [{"id": 1, "type": "LoadVideo", "inputs": {"video_path": "input.mp4"}}, {"id": 2, "type": "VAEEncode", "inputs": {"latent": "latent_image"}}]}' > workflow_valide.json
   ```
2. Valider dans ComfyUI.

---

### Exemple 2 : Documentation en francais avec caracteres non-ASCII
**Prompt initial** :
```
Genere une documentation technique en francais sur l'integration WebGL.
```

**Sortie generee** :
```markdown
# Integration WebGL 

Ce guide explique comment utiliser WebGL pour afficher des videos en temps reel.

## Etapes
1. Charger la video avec `video.load()`
2. Appliquer un shader avec `gl.createShader()`

 Attention : Necessite une carte graphique recente.
```

**Solution** :
1. Nettoyer le texte :
   ```bash
   sed -i 's///g; s///g' documentation.md
   ```
2. Reformuler le prompt :
   ```
   "Genere une documentation technique en francais sur l'integration WebGL. Utilise uniquement des accents standard (e, e, e, c) et evite les emojis. Structure avec des titres Markdown (#, ##)."
   ```

---

### Exemple 3 : Sortie trop large pour un exemple de code
**Prompt initial** :
```
Genere un exemple de code Python pour traiter une video avec OpenCV.
```

**Sortie generee** : 300 lignes de code.

**Solution** :
1. Limiter la sortie dans le prompt :
   ```
   "Genere un exemple de code Python pour traiter une video avec OpenCV. Limite a 100 lignes et inclut uniquement les fonctions essentielles (chargement, conversion, affichage)."
   ```
2. Extraire les lignes utiles :
   ```bash
   head -n 100 mon_script.py > mon_script_limite.py
   ```

---

## Ressources utiles

| Ressource                          | Lien/Description                                                                 |
|------------------------------------|---------------------------------------------------------------------------------|
| Documentation ComfyUI              | [ComfyUI Docs](https://docs.comfy.org/)                                        |
| Guide Markdown                     | [Markdown Guide](https://www.markdownguide.org/)                               |
| Validateur JSON en ligne           | [JSONLint](https://jsonlint.com/)                                              |
| Outil de linting Python            | [Flake8](https://flake8.pycqa.org/)                                            |
| Documentation WebGL                | [WebGL Fundamentals](https://webglfundamentals.org/)                           |
| Template de workflow ComfyUI       | [Exemple dans le depot](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES)   |

---

## Annexe : Foire aux questions

### Q : Comment eviter que Mistral genere du code non-ASCII ?
**R** : Specifiez dans le prompt : "Utilise uniquement des caracteres ASCII ou des accents francais standard (e, e, e, c)."

### Q : Que faire si un workflow ComfyUI genere ne s'ouvre pas dans ComfyUI ?
**R** :
1. Valider le JSON avec `jq` ou un outil en ligne.
2. Verifier que tous les nuds sont connectes.
3. Comparer avec un workflow fonctionnel du depot.

### Q : Comment limiter la taille d'une sortie generee ?
**R** : Ajoutez une contrainte dans le prompt : "Limite a X lignes/tokens maximum."

### Q : Mistral genere du code pour un outil non utilise dans le projet. Que faire ?
**R** : Reformulez le prompt pour exclure explicitement cet outil : "Ne pas inclure de code pour [outil non utilise]."

---

## Historique des modifications

| Version | Date       | Auteur       | Modifications principales                     |
|---------|------------|--------------|-----------------------------------------------|
| 1.0     | 2026-06-03 | Mistral      | Creation du document                          |

---

## Licence

Ce document est distribue sous la licence **CC BY-SA 4.0** (Creative Commons Attribution - Partage dans les memes conditions). Vous etes libre de le partager et d'adapter le contenu, a condition de crediter l'auteur et de partager sous la meme licence.

---

*Derniere mise a jour : 2026-06-03*
*Contact : [Voir SECURITY.md](SECURITY.md)*
