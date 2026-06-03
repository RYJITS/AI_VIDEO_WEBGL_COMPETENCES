## Guide des Prompts pour Mistral en tant que Relecteur Secondaire

Ce document definit des prompts prets a l'emploi pour utiliser Mistral comme second avis lors de la relecture de documentation, templates, README, et petites modifications de code dans le projet **AI_VIDEO_WEBGL_COMPETENCES**. Les prompts sont optimises pour des revues rapides, ciblees et reproductibles.

---

### 1. Contexte et Objectifs

Mistral peut assister les contributeurs et mainteneurs dans les taches suivantes :
- **Relecture de documentation** : README, CONTRIBUTING.md, FAQ.md, GLOSSARY.md, etc.
- **Validation de templates** : Fichiers `.yml` dans `.github/ISSUE_TEMPLATE/`, `.github/pull_request_template.md`.
- **Revue de petits changements de code** : Scripts, workflows GitHub, exemples de configurations.
- **Verification de coherence** : Alignement avec les conventions du projet (ex: structure des issues, format des logs).

**Limites** :
- Ne pas utiliser pour des revues de code critiques ou des decisions architecturales majeures.
- Toujours croiser avec les processus formels (ex: DELEGATION_VALIDATION_MATRIX.md).

---

### 2. Prompts par Type de Contenu

#### 2.1. Relecture de Documentation (README, CONTRIBUTING.md, etc.)

**Prompt de base** :
```
Tu es un relecteur technique experimente pour le projet AI_VIDEO_WEBGL_COMPETENCES. Analyse le document suivant en appliquant les criteres ci-dessous. Reponds en francais.

**Criteres de relecture** :
1. **Clarte** : Le texte est-il comprehensible pour un nouveau contributeur ?
2. **Precision** : Les instructions sont-elles exactes et sans ambiguite ?
3. **Completude** : Les sections essentielles (ex: prerequis, etapes) sont-elles presentes ?
4. **Coherence** : Le ton et le style sont-ils uniformes avec le reste du projet ?
5. **Exemples** : Les exemples de code/workflow sont-ils corrects et complets ?
6. **Liens** : Les liens vers des ressources externes sont-ils valides et pertinents ?

**Document a analyser** :
[Coller le contenu ici]

**Consignes supplementaires** :
- Signale les phrases trop longues ou complexes.
- Propose des reformulations si necessaire.
- Verifie que les termes techniques sont definis dans le GLOSSARY.md.
- Si des sections manquent (ex: FAQ, depannage), propose des titres et des idees de contenu.

**Format de sortie attendu** :
```markdown
### Rapport de relecture pour [Nom du document]

####  Points forts
- [Liste des points positifs]

####  Points a ameliorer
- [Liste des problemes avec suggestions de correction]

####  Questions ouvertes
- [Questions necessitant une clarification ou une decision]

####  Suggestions de sections manquantes
- [Titres et idees pour completer le document]
```
```

**Exemple d'utilisation** :
```
Analyse le fichier CONTRIBUTING.md en utilisant le prompt ci-dessus.
```

---

#### 2.2. Validation de Templates GitHub (.yml, .md)

**Prompt pour les templates d'issues** :
```
Tu es un expert en gestion de projet GitHub pour le projet AI_VIDEO_WEBGL_COMPETENCES. Analyse le template suivant en te basant sur les criteres ci-dessous. Le template est utilise pour collecter des informations aupres des contributeurs.

**Criteres** :
1. **Exhaustivite** : Tous les champs necessaires sont-ils presents ?
2. **Clarte des instructions** : Les placeholders et exemples sont-ils comprehensibles ?
3. **Alignement avec les conventions** : Le template suit-il les bonnes pratiques du projet (ex: format des logs, environnement) ?
4. **Equilibre** : Le template n'est-il ni trop long ni trop court ?

**Template a analyser** :
[Coller le contenu du template ici]

**Consignes supplementaires** :
- Verifie que les labels proposes sont coherents avec le projet (ex: `bug`, `enhancement`, `question`).
- Propose des ameliorations pour les placeholders (ex: ajouter des exemples de commandes).
- Si des sections sont redondantes avec d'autres templates, propose une fusion ou une clarification.

**Format de sortie attendu** :
```markdown
### Rapport de validation pour [Nom du template]

####  Points conformes
- [Liste des elements conformes]

####  Ameliorations suggerees
- [Liste des problemes avec corrections]

####  Questions
- [Questions sur des choix de conception]
```
```

**Exemple d'utilisation** :
```
Valide le template bug_report.yml en utilisant le prompt ci-dessus.
```

---

#### 2.3. Revue de Petits Changements de Code

**Prompt pour les scripts et workflows** :
```
Tu es un expert en automatisation et en scripts pour le projet AI_VIDEO_WEBGL_COMPETENCES. Analyse le code ou le workflow suivant en appliquant les criteres ci-dessous. Le code est ecrit pour des environnements Windows avec ComfyUI et des outils comme Python/Node.js.

**Criteres** :
1. **Fonctionnalite** : Le code/workflow fait-il ce qu'il pretend faire ?
2. **Robustesse** : Gere-t-il les erreurs courantes (ex: chemins incorrects, variables manquantes) ?
3. **Lisibilite** : Le code est-il bien commente et structure ?
4. **Securite** : Aucune fuite de secrets ou de chemins sensibles n'est presente.
5. **Compatibilite** : Le code est-il compatible avec les versions des outils mentionnes (ex: ComfyUI 0.9.x) ?
6. **Performance** : Les boucles ou operations lourdes sont-elles optimisees ?

**Code/Workflow a analyser** :
[Coller le contenu ici]

**Consignes supplementaires** :
- Verifie que les chemins sont relatifs ou correctement configures pour Windows.
- Propose des tests unitaires simples si le code est une fonctionnalite critique.
- Signale les dependances manquantes ou obsoletes.
- Si le workflow est pour ComfyUI, verifie qu'il utilise les nodes standard du projet.

**Format de sortie attendu** :
```markdown
### Rapport de revue pour [Nom du fichier/script]

####  Fonctionnalites validees
- [Liste des fonctionnalites correctes]

####  Problemes identifies
- [Liste des bugs ou incoherences avec corrections]

####  Suggestions d'amelioration
- [Optimisations ou bonnes pratiques a appliquer]

####  Tests recommandes
- [Idees de tests pour valider les changements]
```
```

**Exemple d'utilisation** :
```
Revue le fichier .github/workflows/validate-repo.yml en utilisant le prompt ci-dessus.
```

---

### 3. Prompts Avances

#### 3.1. Verification de Coherence entre Documents

**Prompt** :
```
Tu es un expert en documentation technique pour le projet AI_VIDEO_WEBGL_COMPETENCES. Verifie la coherence des informations entre les documents suivants. Le projet utilise des conventions strictes pour les termes techniques, les versions des outils, et les processus.

**Documents a comparer** :
1. [Document 1]
2. [Document 2]

**Criteres** :
1. **Terminologie** : Les termes techniques (ex: "ComfyUI", "Wan", "LTX") sont-ils utilises de maniere coherente ?
2. **Versions** : Les versions des outils mentionnees sont-elles alignees avec les fichiers de configuration (ex: `requirements.txt`) ?
3. **Processus** : Les etapes decrites dans les documents sont-elles alignees avec les templates GitHub (ex: format des issues) ?
4. **Exemples** : Les exemples de code ou de workflows sont-ils coherents entre les documents ?

**Consignes supplementaires** :
- Liste les incoherences avec les numeros de ligne si possible.
- Propose une version corrigee pour les termes ou versions problematiques.
- Si des documents manquent des informations, note-les comme "A completer".

**Format de sortie attendu** :
```markdown
### Rapport de coherence entre [Doc1] et [Doc2]

####  Points coherents
- [Liste des elements coherents]

####  Incoherences detectees
- [Liste des problemes avec documents sources et suggestions]

####  Documents a mettre a jour
- [Liste des documents necessitant une correction]
```
```

---

#### 3.2. Generation de Contenu Complementaire

**Prompt pour generer des sections manquantes** :
```
Tu es un redacteur technique pour le projet AI_VIDEO_WEBGL_COMPETENCES. Genere une section manquante pour le document suivant en te basant sur les conventions du projet et les bonnes pratiques de la documentation technique.

**Document de reference** :
[Coller le contenu existant]

**Section a generer** :
- Titre suggere : [Ex: "Depannage", "FAQ", "Exemples de workflows"]
- Contexte : [Ex: "Cette section doit aider les nouveaux contributeurs a resoudre les problemes courants lors de l'installation."]

**Consignes** :
- Utilise le meme style et ton que le document existant.
- Inclure des exemples concrets et des commandes reproductibles.
- Ajoute des liens vers les ressources pertinentes (ex: GLOSSARY.md, issues similaires).
- Si des termes techniques sont utilises, definis-les brievement.

**Format de sortie attendu** :
```markdown
### [Titre de la section]

[Contenu genere en markdown, pret a etre insere]
```
```

---

### 4. Bonnes Pratiques pour Utiliser Mistral en Revue

1. **Precision** : 
   - Fournis toujours le contexte complet (ex: extrait du document, ligne de code specifique).
   - Evite les prompts vagues comme "Analyse ce fichier".

2. **Iteration** :
   - Utilise les retours de Mistral pour affiner ta demande. Par exemple :
     - "Peux-tu reformuler la section X en gardant le meme sens ?"
     - "Verifie que les exemples de code dans la section Y sont corrects."

3. **Validation croisee** :
   - Croise toujours les retours de Mistral avec les processus formels du projet (ex: DELEGATION_VALIDATION_MATRIX.md).

4. **Formatage** :
   - Prefere les prompts en markdown pour une meilleure lisibilite des retours.

5. **Limites** :
   - Ne pas utiliser Mistral pour des decisions critiques sans validation humaine.
   - Toujours verifier les suggestions de code/workflow avant application.

---

### 5. Exemples Concrets

#### 5.1. Revue d'un README

**Prompt utilise** :
```
Tu es un relecteur technique pour le projet AI_VIDEO_WEBGL_COMPETENCES. Analyse le README suivant en appliquant les criteres de clarte, precision, et completude. Reponds en francais.

**Criteres** :
- Le README explique-t-il clairement comment installer et utiliser le projet ?
- Les prerequis sont-ils listes de maniere exhaustive ?
- Les exemples de commandes sont-ils corrects et complets ?
- Le document est-il a jour avec les dernieres versions des outils ?

**README a analyser** :
[Coller le contenu du README ici]
```

**Sortie attendue** :
- Une liste des sections a ameliorer (ex: ajout d'une section "Depannage").
- Des suggestions de reformulation pour les phrases ambigues.
- Une verification des liens et des exemples de code.

---

#### 5.2. Validation d'un Template d'Issue

**Prompt utilise** :
```
Tu es un expert en gestion de projet GitHub. Valide le template feature_request.yml en verifiant son exhaustivite et sa clarte. Le template doit permettre aux contributeurs de proposer des ameliorations de maniere structuree.

**Template a analyser** :
[Coller le contenu de feature_request.yml]
```

**Sortie attendue** :
- Une confirmation que tous les champs necessaires sont presents.
- Des suggestions pour ameliorer les placeholders (ex: ajouter des exemples de competences a ameliorer).
- Une verification que les labels proposes sont coherents avec le projet.

---

### 6. Annexes

#### 6.1. Ressources Utiles

- [DELEGATION_VALIDATION_MATRIX.md](DELEGATION_VALIDATION_MATRIX.md) : Matrice de validation pour les contributions.
- [DELEGATED_DOCS_ACCEPTANCE.md](DELEGATED_DOCS_ACCEPTANCE.md) : Processus d'acceptation des contributions documentaires.
- [GLOSSARY.md](GLOSSARY.md) : Definitions des termes techniques.
- [CONTRIBUTING.md](CONTRIBUTING.md) : Guide pour contribuer au projet.

#### 6.2. Checklist Rapide pour les Revues

Avant de soumettre une demande de revue a Mistral, verifie :
- [ ] Le contenu est-il complet et pret pour une relecture ?
- [ ] Les prompts sont-ils precis et contextualises ?
- [ ] Les criteres de relecture sont-ils adaptes au type de contenu ?
- [ ] Les suggestions de Mistral seront-elles croisees avec les processus formels ?

---

### 7. Limites et Responsabilites

- **Mistral n'est pas un outil de decision** : Ses retours doivent etre consideres comme des suggestions.
- **Responsabilite humaine** : Toujours valider les changements critiques avec les mainteneurs du projet.
- **Confidentialite** : Ne jamais partager de secrets ou de donnees sensibles dans les prompts.

---

### 8. Historique des Modifications

| Version | Date       | Auteur       | Modifications principales                     |
|---------|------------|--------------|-----------------------------------------------|
| 1.0     | 2026-06-03 | Mistral      | Creation du guide initial                     |

---

**Licence** : Ce document est distribue sous la licence du projet parent (a definir par l'utilisateur).

**Contact** : Pour des questions ou suggestions, ouvrir une issue avec le label `documentation`.
