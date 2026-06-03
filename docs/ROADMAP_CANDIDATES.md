# ROADMAP CANDIDATES

Ce document liste les futures orientations candidates pour le projet **AI_VIDEO_WEBGL_COMPETENCES**, classees par niveau d'effort. Les propositions sont inspirees des templates d'issues existants (bug_report.yml, feature_request.yml) et des besoins identifies dans la documentation.

---

##  Contexte
Le projet vise a fournir un kit complet pour generer des videos via IA et WebGL, avec des workflows ComfyUI, des competences techniques (Cerveau), et des exemples concrets. Les orientations futures doivent renforcer l'automatisation, la documentation, et l'integration WebGL.

---

##  Criteres de priorisation
- **Effort** : Temps estime pour implementer la proposition.
- **Impact** : Benefice pour les utilisateurs ou les contributeurs.
- **Alignement** : Coherence avec les templates d'issues existants.

---

##  Orientations par niveau d'effort

###  **Low Effort** (1-3 jours)
Propositions simples, souvent documentaires ou d'automatisation legere.

#### 1. **Ameliorer la documentation des competences Cerveau**
- **Pourquoi** : Les competences techniques (ex: gestion de memoire, optimisation GPU) manquent de details pratiques.
- **Actions** :
  - Ajouter des exemples de code commentes dans `docs/COMFYUI_SETUP_CHECKLIST.md`.
  - Creer un guide "Comment contribuer une nouvelle competence" dans `CONTRIBUTING.md`.
- **Validation** : Revue par les maintainers via une PR.

#### 2. **Automatiser la generation des contact sheets**
- **Pourquoi** : Les contact sheets sont manuellement generees dans `docs/CONTACT_SHEET_QA.md`.
- **Actions** :
  - Creer un script Python (ex: `scripts/generate_contact_sheet.py`) pour automatiser la generation a partir des logs.
  - Integrer ce script dans le workflow `validate-repo.yml`.
- **Validation** : Executer le script sur un exemple existant.

#### 3. **Ajouter des exemples de workflows ComfyUI pour WebGL**
- **Pourquoi** : Peu d'exemples concrets montrent l'integration WebGL dans les workflows.
- **Actions** :
  - Creer un dossier `examples/webgl_integration/` avec des workflows prets a l'emploi.
  - Documenter les etapes dans `docs/EXAMPLES_INDEX.md`.
- **Validation** : Tester les workflows avec un modele WebGL standard.

#### 4. **Traduire les templates d'issues en anglais**
- **Pourquoi** : Les templates (`bug_report.yml`, `feature_request.yml`) sont en francais, limitant l'accessibilite internationale.
- **Actions** :
  - Dupliquer les templates en anglais dans `.github/ISSUE_TEMPLATE/`.
  - Mettre a jour le fichier `config.yml` pour pointer vers les deux versions.
- **Validation** : Verifier que les deux versions fonctionnent dans GitHub.

---

###  **Medium Effort** (1-4 semaines)
Propositions necessitant des developpements ou des refactorisations moderees.

#### 1. **Creer un systeme de validation automatique des competences Cerveau**
- **Pourquoi** : Les competences techniques (ex: gestion de memoire) necessitent des tests rigoureux.
- **Actions** :
  - Developper un script de validation (ex: `scripts/validate_skills.py`) qui teste les competences dans un environnement isole.
  - Integrer ce script dans un nouveau workflow GitHub (ex: `validate-skills.yml`).
- **Validation** : Executer le script sur toutes les competences existantes.

#### 2. **Optimiser les workflows ComfyUI pour les GPU bas de gamme**
- **Pourquoi** : Les workflows actuels ciblent des GPU haut de gamme (ex: RTX 4070).
- **Actions** :
  - Identifier les goulots d'etranglement dans les workflows (ex: taille des tensors).
  - Proposer des alternatives optimisees (ex: reduction de la resolution, utilisation de modeles legers).
  - Documenter les optimisations dans `docs/KNOWN_LIMITS.md`.
- **Validation** : Tester les workflows optimises sur un GPU bas de gamme (ex: RTX 3060).

#### 3. **Developper un outil de benchmarking pour les performances WebGL**
- **Pourquoi** : Peu d'outils mesurent les performances des rendus WebGL dans les workflows.
- **Actions** :
  - Creer un script (ex: `scripts/benchmark_webgl.py`) qui mesure le temps de rendu et l'utilisation GPU.
  - Generer un rapport comparatif dans `docs/C2R_V9_MICRO_PILOT_REPORT.md`.
- **Validation** : Executer le benchmark sur plusieurs configurations materielles.

#### 4. **Ameliorer l'integration des modeles IA dans les workflows**
- **Pourquoi** : Les modeles IA (ex: Stable Diffusion, ControlNet) sont souvent mal documentes dans les workflows.
- **Actions** :
  - Creer un guide "Comment integrer un nouveau modele IA" dans `docs/AUTOMATION_IDEAS.md`.
  - Proposer des presets pour les modeles populaires (ex: SDXL, FLUX).
- **Validation** : Tester l'integration avec un modele non documente.

---

###  **High Effort** (1-6 mois)
Propositions ambitieuses necessitant des developpements majeurs ou des refactorisations.

#### 1. **Developper une interface graphique pour ComfyUI**
- **Pourquoi** : ComfyUI est puissant mais complexe pour les debutants.
- **Actions** :
  - Concevoir une interface simplifiee (ex: en Electron ou Tauri) pour gerer les workflows.
  - Integrer cette interface dans le depot principal ou en tant que sous-module.
- **Validation** : Tester l'interface avec des utilisateurs non techniques.

#### 2. **Creer un systeme de partage de competences Cerveau**
- **Pourquoi** : Les competences techniques sont actuellement statiques et peu reutilisables.
- **Actions** :
  - Developper un systeme de plugins pour les competences (ex: format JSON/YAML).
  - Creer un depot centralise (ex: GitHub) pour partager les competences.
  - Integrer ce systeme dans `CONTRIBUTING.md`.
- **Validation** : Partager une competence personnalisee via le systeme.

#### 3. **Automatiser la generation de videos a partir de prompts texte**
- **Pourquoi** : Les workflows actuels necessitent des etapes manuelles pour generer des videos.
- **Actions** :
  - Developper un outil (ex: `scripts/auto_video_generator.py`) qui prend un prompt texte et genere une video.
  - Integrer cet outil dans les workflows ComfyUI.
- **Validation** : Generer une video a partir d'un prompt complexe.

#### 4. **Refactoriser l'architecture des competences Cerveau**
- **Pourquoi** : L'architecture actuelle est monolithique et difficile a maintenir.
- **Actions** :
  - Separer les competences en modules independants (ex: `skills/memory/`, `skills/gpu/`).
  - Mettre a jour la documentation (`docs/COMFYUI_SETUP_CHECKLIST.md`) pour refleter cette separation.
- **Validation** : Verifier que toutes les competences fonctionnent apres refactorisation.

---

##  Suivi des orientations
Les orientations listees ici sont des **candidates** et doivent etre discutees dans les issues ou les discussions GitHub avant d'etre implementees. Pour proposer une nouvelle orientation, utilisez le template `feature_request.yml`.

---

##  Liens utiles
- [Template de feature request](.github/ISSUE_TEMPLATE/feature_request.yml)
- [Documentation technique](docs/COMFYUI_SETUP_CHECKLIST.md)
- [Exemples de workflows](docs/EXAMPLES_INDEX.md)

---

*Derniere mise a jour : Juin 2026*
*Projet : AI_VIDEO_WEBGL_COMPETENCES*
