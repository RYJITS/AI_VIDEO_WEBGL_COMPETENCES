# Runbook pour les Agents Ameliorant les Depots GitHub

Ce document est un guide operationnel pour les agents (humains ou automatises) souhaitant ameliorer des depots GitHub via des taches legeres de documentation et de code. Il s'appuie sur les processus existants du depot **AI_VIDEO_WEBGL_COMPETENCES** et propose une methodologie structuree pour des interventions efficaces et reproductibles.

---

## Objectif

Permettre aux agents de :
- Comprendre le cadre de travail et les attentes pour les ameliorations legeres.
- Identifier les taches eligibles a une intervention agent.
- Appliquer des bonnes pratiques pour des contributions claires et utiles.
- Valider localement les changements avant de les proposer.
- Collaborer efficacement avec les mainteneurs et les contributeurs.

---

## Public Cible

- **Agents humains** : Contributeurs occasionnels ou membres de l'equipe projet souhaitant deleguer des taches a Mistral.
- **Agents automatises** : Scripts ou outils utilisant Mistral pour des ameliorations ciblees (ex : mise a jour de documentation, correction de workflows).
- **Mainteneurs** : Equipe responsable de la validation et de la fusion des contributions.

---

## Cadre de Travail

### 1. Types de Taches Eligibles

Les agents peuvent intervenir sur les types de taches suivants, **a condition qu'elles soient legeres et ne necessitent pas de refactoring majeur** :

| Categorie | Exemples de Taches | Criteres d'Eligibilite |
|-----------|--------------------|-----------------------|
| **Documentation** | - Ajout d'une entree dans `GLOSSARY.md`.
- Correction de fautes dans `FAQ.md`.
- Mise a jour d'une section dans `CONTRIBUTING.md`.
- Creation d'un exemple simple dans `EXAMPLES_INDEX.md`. | La tache doit etre ciblee, sans impact sur la logique du projet. |
| **Workflow ComfyUI** | - Correction d'un workflow JSON simple (ex : ajustement de parametres).
- Ajout d'un preset de base pour un nouveau modele.
- Documentation d'un workflow existant dans `AUTOMATION_IDEAS.md`. | Le workflow doit etre teste localement et compatible avec ComfyUI. |
| **Validation et QA** | - Ajout d'une entree dans `KNOWN_LIMITS.md` pour un probleme mineur.
- Mise a jour de `TROUBLESHOOTING_QUICK.md` avec une solution courante.
- Creation d'un contact sheet pour valider une video generee. | La tache doit etre basee sur une observation reproductible. |
| **Automatisation Legere** | - Script PowerShell pour valider les chemins de fichiers.
- Ajout d'une commande dans `LOCAL_VALIDATION.md` pour un outil specifique. | Le script doit etre portable et ne pas dependre de secrets. |
| **Amelioration des Issues/PR** | - Mise a jour du template `.github/ISSUE_TEMPLATE/bug_report.yml` pour clarifier un champ.
- Ajout d'exemples dans `.github/pull_request_template.md`. | La modification doit ameliorer la clarte sans ajouter de complexite. |

### 2. Taches Non Eligibles

Les agents **ne doivent pas** :
- Modifier des fichiers critiques sans validation prealable (ex : `README.md`, `CONTRIBUTING.md` si la modification est majeure).
- Ajouter des dependances lourdes ou des outils externes sans justification claire.
- Supprimer ou renommer des fichiers sans accord des mainteneurs.
- Modifier les workflows GitHub (fichiers `.github/workflows/`) sans validation explicite.
- Travailler sur des fonctionnalites experimentales ou non documentees.

---

## Processus d'Intervention

### Etape 1 : Identification de la Tache

1. **Analyser le besoin** : Identifier une opportunite d'amelioration legere dans le depot.
   - Exemples : Une entree manquante dans `GLOSSARY.md`, une correction de workflow, une clarification dans `FAQ.md`.
2. **Verifier l'eligibilite** : S'assurer que la tache correspond aux criteres du **Cadre de Travail** (section ci-dessus).
3. **Consulter les documents existants** : Explorer `MISTRAL_DOCS_INDEX_APPENDIX.md` et `MISTRAL_TASK_CATALOG.md` pour eviter les doublons.

### Etape 2 : Planification

1. **Definir l'objectif** : Rediger une description claire de la tache a accomplir.
   - Exemple : "Ajouter une entree pour 'WebGL' dans `GLOSSARY.md` avec une definition concise."
2. **Identifier les fichiers a modifier** : Lister les fichiers concernes et leur emplacement.
3. **Estimer l'effort** : La tache doit etre realisable en moins de 2 heures pour un agent humain.

### Etape 3 : Preparation de l'Environnement

1. **Cloner le depot** :
   ```powershell
   git clone https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES.git
   cd AI_VIDEO_WEBGL_COMPETENCES
   ```
2. **Creer une branche dediee** :
   ```powershell
   git checkout -b agent/amelioration-<description-courte>
   ```
3. **Installer les outils necessaires** :
   - ComfyUI (si modification de workflows).
   - PowerShell (pour les scripts de validation).
   - Un editeur de texte (VS Code, Notepad++, etc.).

### Etape 4 : Realisation de la Tache

#### Pour la Documentation
1. **Respecter le style du depot** :
   - Utiliser le francais clair et technique.
   - Inclure des exemples concrets si necessaire.
   - Eviter les grands paragraphes abstraits.
2. **Structurer le contenu** :
   - Utiliser des sections, des listes a puces et des tableaux.
   - Ajouter des liens vers d'autres documents si pertinent.
3. **Valider la coherence** :
   - Verifier que les termes techniques sont definis dans `GLOSSARY.md`.
   - S'assurer que les chemins de fichiers sont relatifs.

#### Pour les Workflows ComfyUI
1. **Tester localement** :
   - Ouvrir le workflow dans ComfyUI.
   - Verifier que les parametres sont coherents et que le workflow s'execute sans erreur.
2. **Documenter les changements** :
   - Ajouter une entree dans `AUTOMATION_IDEAS.md` si le workflow est nouveau.
   - Mettre a jour `EXAMPLES_INDEX.md` si le workflow est un exemple.
3. **Inclure des metadonnees** :
   - Ajouter des commentaires dans le fichier JSON pour expliquer les parametres cles.
   - Documenter les temps d'execution et les ressources utilisees (ex : GPU, RAM).

#### Pour les Scripts de Validation
1. **Ecrire un script portable** :
   - Utiliser PowerShell pour une compatibilite Windows.
   - Eviter les dependances externes non standard.
2. **Documenter l'usage** :
   - Ajouter une section dans `LOCAL_VALIDATION.md` ou creer un nouveau fichier si necessaire.
   - Inclure des exemples d'execution.
3. **Tester le script** :
   - Executer le script sur plusieurs fichiers pour verifier sa robustesse.

### Etape 5 : Validation Locale

1. **Verifier les chemins** :
   ```powershell
   git status --short
   ```
2. **Valider les fichiers JSON** :
   ```powershell
   Get-ChildItem -Recurse -File -Include *.json | ForEach-Object { Get-Content $_.FullName -Raw | ConvertFrom-Json | Out-Null }
   ```
3. **Tester les workflows** :
   - Ouvrir les workflows modifies dans ComfyUI et verifier leur execution.
4. **Verifier la documentation** :
   - Relire les sections modifiees pour s'assurer qu'elles sont claires et sans fautes.

### Etape 6 : Soumission de la Contribution

1. **Creer une Pull Request (PR)** :
   - Utiliser le template `.github/pull_request_template.md`.
   - Cocher les cases pertinentes (ex : Documentation, Workflow ComfyUI).
2. **Rediger une description claire** :
   - Expliquer le changement et son objectif.
   - Inclure des captures d'ecran ou des logs si pertinent (sans secrets).
3. **Taguer les mainteneurs** :
   - Utiliser `@maintainer` dans la description de la PR pour notifier l'equipe.

### Etape 7 : Revue et Fusion

1. **Repondre aux commentaires** :
   - Clarifier les points souleves par les reviewers.
   - Appliquer les suggestions si elles sont pertinentes.
2. **Valider les tests** :
   - Verifier que les workflows GitHub passent (ex : `validate-repo.yml`).
3. **Fusionner la PR** :
   - Une fois la PR approuvee, la fusionner dans la branche principale.

---

## Bonnes Pratiques pour les Agents

### 1. Communication
- **Clarte** : Rediger des descriptions de taches et des PR precises et concises.
- **Transparence** : Documenter les decisions et les changements apportes.
- **Collaboration** : Repondre rapidement aux commentaires et aux demandes de clarification.

### 2. Qualite du Code/Documentation
- **Simplicite** : Privilegier des solutions simples et maintenables.
- **Reproductibilite** : S'assurer que les changements peuvent etre reproduits par d'autres.
- **Validation** : Toujours tester localement avant de soumettre une PR.

### 3. Gestion des Risques
- **Eviter les doublons** : Consulter `MISTRAL_DOCS_INDEX_APPENDIX.md` avant d'ajouter une nouvelle entree.
- **Respecter les limites** : Ne pas modifier des fichiers critiques sans validation.
- **Documenter les limites** : Si une tache depasse le cadre leger, la signaler dans une issue.

### 4. Utilisation des Outils
- **PowerShell** : Utiliser pour les scripts de validation et les commandes Git.
- **ComfyUI** : Tester les workflows avant de les soumettre.
- **Markdown** : Respecter la syntaxe et le style du depot.

---

## Exemples Concrets

### Exemple 1 : Ajout d'une Entree dans le Glossaire
**Tache** : Ajouter une definition pour "Prompt Engineering" dans `docs/GLOSSARY.md`.

**Etapes** :
1. Identifier l'emplacement dans `GLOSSARY.md` (section "Techniques IA").
2. Rediger une definition concise :
   ```markdown
   - **Prompt Engineering** : Discipline consistant a concevoir des prompts (instructions textuelles) pour guider des modeles d'IA generative (ex : ComfyUI, Wan/LTX) vers des resultats precis et reproductibles. Inclut l'optimisation des formulations, la structuration des consignes et l'adaptation aux limites des modeles.
   ```
3. Valider localement :
   ```powershell
   git add docs/GLOSSARY.md
   git commit -m "docs(glossary): ajouter definition de 'Prompt Engineering'"
   ```
4. Soumettre une PR avec une description claire.

**Resultat** : La definition est ajoutee et disponible pour tous les contributeurs.

---

### Exemple 2 : Correction d'un Workflow ComfyUI
**Tache** : Corriger un workflow JSON pour ajuster un parametre de resolution.

**Etapes** :
1. Identifier le workflow dans `examples/workflows/` (ex : `video-start-end.json`).
2. Ouvrir le fichier dans un editeur et modifier le parametre :
   ```json
   "resolution": {
     "width": 1920,
     "height": 1080
   }
   ```
   
   ```json
   "resolution": {
     "width": 1280,
     "height": 720
   }
   ```
3. Tester le workflow dans ComfyUI pour s'assurer qu'il s'execute sans erreur.
4. Documenter le changement dans `AUTOMATION_IDEAS.md` :
   ```markdown
   - **video-start-end.json** : Ajustement de la resolution de 1920x1080 a 1280x720 pour reduire la charge GPU sur les machines modestes.
   ```
5. Valider localement et soumettre une PR.

**Resultat** : Le workflow est corrige et documente pour une meilleure compatibilite.

---

### Exemple 3 : Mise a Jour de la FAQ
**Tache** : Ajouter une reponse a une question frequente dans `docs/FAQ.md`.

**Etapes** :
1. Identifier la section pertinente dans `FAQ.md` (ex : "Configuration").
2. Rediger une reponse claire :
   ```markdown
   **Q : Comment reduire les temps de generation dans ComfyUI ?**
   R : Plusieurs facteurs influencent les temps de generation :
   - Utiliser une resolution plus faible (ex : 1280x720 au lieu de 1920x1080).
   - Desactiver les previsualisations en temps reel si elles ne sont pas necessaires.
   - Verifier que les modeles utilises sont optimises pour votre GPU (ex : utiliser des versions FP16 si disponible).
   - Consulter `COMFYUI_SETUP_CHECKLIST.md` pour des conseils de configuration avancee.
   ```
3. Valider la coherence avec les autres documents.
4. Soumettre une PR avec une description detaillee.

**Resultat** : La FAQ est enrichie et repond a une question frequente.

---

## Annexes

### 1. Commandes Utiles

```powershell
# Lister les fichiers modifies dans une branche
git diff --name-only

# Valider un fichier JSON
Get-Content .\chemin\vers\fichier.json | ConvertFrom-Json | Out-Null

# Verifier la syntaxe Markdown (necessite Node.js)
npx markdownlint-cli2 "docs/**/*.md"

# Tester un workflow ComfyUI (exemple avec PowerShell)
$workflowPath = ".\examples\workflows\video-start-end.json"
Get-Content $workflowPath -Raw | ConvertFrom-Json | Out-Null
Write-Host "Workflow valide : $workflowPath"
```

### 2. Checklist de Validation Locale

Avant de soumettre une PR, verifier les points suivants :
- [ ] Tous les chemins de fichiers sont relatifs.
- [ ] Aucun secret, token ou fichier `.env` n'est inclus.
- [ ] Les fichiers JSON sont valides.
- [ ] Les workflows s'ouvrent dans ComfyUI sans erreur.
- [ ] La documentation est claire et sans fautes.
- [ ] Les exemples ajoutes sont utiles et legers.
- [ ] Les scripts PowerShell sont portables et documentes.

### 3. Ressources Externes

- [Documentation ComfyUI](https://docs.comfy.org/)
- [Guide GitHub pour les Contributeurs](https://docs.github.com/fr/get-started/quickstart/contributing-to-projects)
- [PowerShell Documentation](https://learn.microsoft.com/fr-fr/powershell/)

---

## Historique des Modifications

| Version | Date | Auteur | Modifications |
|---------|------|--------|---------------|
| 1.0 | 2026-06-03 | Mistral | Creation initiale du runbook. |

---

*Ce document est genere automatiquement et peut etre mis a jour par Mistral ou les contributeurs du projet. Pour toute question, ouvrir une issue avec le template `.github/ISSUE_TEMPLATE/question.yml`.*
