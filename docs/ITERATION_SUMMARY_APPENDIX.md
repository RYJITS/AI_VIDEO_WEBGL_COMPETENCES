# Annexe : Resume des Artefacts d'Iteration GitHub

Ce document resume les artefacts d'iteration ajoutes ou mis a jour lors du test de delegation, et fournit des instructions pour leur utilisation future par les agents et contributeurs.

---

## Contexte

Le projet **AI_VIDEO_WEBGL_COMPETENCES** utilise GitHub comme plateforme centrale pour gerer les iterations, les demandes d'amelioration, les questions et les configurations de workflows. Les artefacts decrits ci-dessous sont concus pour standardiser les contributions et faciliter la maintenance du projet.

---

## Artefacts d'Iteration

### 1. Templates d'Issues

#### a. `bug_report.yml`
**Objectif** : Signaler un probleme reproductible dans la documentation, les scripts, les workflows ou les exemples.

**Structure** :
- **Probleme** : Description du dysfonctionnement.
- **Reproduction** : Etapes pour reproduire le probleme (commandes, fichiers, workflows).
- **Resultat attendu** : Comportement attendu.
- **Environnement** : Details techniques (OS, GPU, versions des outils, modeles utilises).
- **Medias** : Captures d'ecran, logs ou contact sheets utiles (sans secrets).

**Utilisation** :
- A utiliser pour tout probleme necessitant une investigation technique.
- Exemple d'utilisation : Un agent signale une erreur dans un workflow ComfyUI.

---

#### b. `feature_request.yml`
**Objectif** : Proposer une amelioration du kit, des competences, des presets ou des exemples.

**Structure** :
- **Besoin** : Probleme que l'amelioration resout.
- **Proposition** : Description de la solution souhaitee.
- **Zone concernee** : Categorie de l'amelioration (Documentation, Skill Codex, Competence Cerveau, Workflow ComfyUI, Exemple video, WebGL, Script d'installation).
- **Validation attendue** : Criteres pour valider que l'amelioration fonctionne.

**Utilisation** :
- A utiliser pour proposer des fonctionnalites nouvelles ou des optimisations.
- Exemple d'utilisation : Un contributeur suggere l'ajout d'un preset pour un modele specifique.

---

#### c. `question.yml`
**Objectif** : Poser une question ou demander de l'aide sur l'utilisation, la configuration ou les competences.

**Structure** :
- **Question** : Description de la question ou du besoin d'aide.
- **Contexte** : Environnement, version, etapes suivies ou fichiers concernes.
- **Medias** : Captures ou logs utiles (sans secrets).

**Utilisation** :
- A utiliser pour des demandes d'assistance non liees a un bug ou une feature.
- Exemple d'utilisation : Un nouvel utilisateur demande comment configurer un environnement ComfyUI.

---

#### d. `workflow_request.yml`
**Objectif** : Demander de l'aide pour configurer un workflow ComfyUI, Wan/LTX ou integrer une nouvelle fonctionnalite.

**Structure** :
- **Contexte** : Description du workflow souhaite ou du probleme rencontre.
- **Configuration actuelle** : Environnement et etapes deja realisees.
- **Workflow souhaite** : Description du workflow ideal ou schema partage.
- **Erreurs ou blocages** : Messages d'erreur ou comportements inattendus.
- **Environnement detaille** : OS, versions des outils, ressources utilisees.
- **Fichiers utiles** : Captures, workflows JSON ou logs (sans secrets).
- **Verifications prealables** : Checklist des ressources consultees avant de poster.

**Utilisation** :
- A utiliser pour des demandes de configuration avancee ou d'integration de workflows.
- Exemple d'utilisation : Un utilisateur demande de l'aide pour configurer un workflow LTX avec un modele specifique.

---

### 2. Template de Pull Request

**Objectif** : Standardiser les contributions et faciliter la revue de code.

**Structure** :
- **Resume** : Description concise du changement.
- **Type de changement** : Categorie du changement (Documentation, Skill Codex, Competence Cerveau, Workflow ComfyUI, Exemple video, Script d'installation).
- **Verification** : Checklist pour valider la qualite du changement (chemins relatifs, absence de secrets, validite des JSON, preuves visuelles pour les videos, mise a jour de la documentation si necessaire).
- **Notes QA** : Details techniques pour la validation (reglages, durees, frames, steps, FPS, modele, observations visuelles).

**Utilisation** :
- A utiliser pour toute contribution necessitant une revue de code.
- Exemple d'utilisation : Un agent propose une correction dans un script d'installation.

---

## Bonnes Pratiques pour les Futurs Agents

### 1. Utilisation des Templates

- **Choisir le bon template** : Utiliser `bug_report.yml` pour les bugs, `feature_request.yml` pour les ameliorations, `question.yml` pour les demandes d'aide, et `workflow_request.yml` pour les configurations avancees.
- **Remplir les champs obligatoires** : Tous les champs marques comme `required` doivent etre remplis pour eviter les retards dans le traitement des issues.
- **Fournir des preuves** : Ajouter des captures, logs ou fichiers utiles pour faciliter l'investigation.

### 2. Validation des Contributions

- **Verifier les chemins** : S'assurer que tous les chemins de fichiers sont relatifs ou generalisables.
- **Eviter les secrets** : Ne jamais inclure de tokens, fichiers `.env` ou chemins prives sensibles.
- **Valider les JSON** : Utiliser des outils comme [JSONLint](https://jsonlint.com/) pour valider les fichiers JSON ajoutes ou modifies.
- **Preuves visuelles** : Pour les changements touchant a la generation video, ajouter des contact sheets ou des videos de validation.

### 3. Processus de Revue

- **Verifier la checklist** : S'assurer que tous les points de la checklist du template de PR sont coches.
- **Tester localement** : Valider les changements en local avant de soumettre une PR, en utilisant les outils de validation fournis dans le projet (voir `docs/LOCAL_VALIDATION.md`).
- **Documenter les observations** : Dans les notes QA, detailler les reglages, durees, et observations visuelles pour faciliter la revue.

### 4. Gestion des Issues

- **Prioriser les issues** : Les bugs critiques doivent etre traites en priorite, suivis des demandes de features et des questions.
- **Fermer les issues resolues** : Une fois une issue resolue, la fermer et ajouter un commentaire avec les details de la resolution.
- **Mettre a jour la documentation** : Si une issue entraine une modification de la documentation, mettre a jour les fichiers concernes (ex: `README.md`, `docs/*.md`).

---

## Exemples Concrets

### Exemple 1 : Signalement d'un Bug

**Scenario** : Un agent remarque que le workflow `video_generation.json` ne fonctionne pas avec le modele `SDXL`.

**Etapes** :
1. Ouvrir une nouvelle issue en utilisant le template `bug_report.yml`.
2. Remplir le champ **Probleme** : "Le workflow `video_generation.json` echoue avec le modele SDXL."
3. Remplir le champ **Reproduction** :
   ```
   1. Ouvrir ComfyUI.
   2. Charger le workflow `video_generation.json`.
   3. Selectionner le modele SDXL.
   4. Executer le workflow.
   5. Observer l'erreur : "CUDA out of memory".
   ```
4. Remplir le champ **Resultat attendu** : "Le workflow doit generer une video sans erreur."
5. Remplir le champ **Environnement** :
   ```
   - OS : Windows 11
   - GPU : RTX 4070
   - ComfyUI : 0.9.5
   - Python : 3.11
   - Modele : SDXL
   ```
6. Ajouter une capture d'ecran de l'erreur dans le champ **Medias**.
7. Soumettre l'issue.

**Resultat** : L'equipe peut reproduire le probleme et proposer une solution (ex: optimisation du workflow ou mise a jour de la documentation).

---

### Exemple 2 : Proposition d'une Feature

**Scenario** : Un contributeur souhaite ajouter un preset pour le modele `Flux.1-dev`.

**Etapes** :
1. Ouvrir une nouvelle issue en utilisant le template `feature_request.yml`.
2. Remplir le champ **Besoin** : "Le projet ne propose pas de preset pour le modele Flux.1-dev, ce qui rend son utilisation difficile pour les nouveaux utilisateurs."
3. Remplir le champ **Proposition** : "Ajouter un preset `flux_1_dev.json` dans le dossier `presets/` avec les reglages optimaux pour Flux.1-dev."
4. Selectionner **Zone concernee** : "Skill Codex".
5. Remplir le champ **Validation attendue** : "Le preset doit permettre de generer une video de 10 secondes en 1 minute avec une qualite acceptable."
6. Soumettre l'issue.

**Resultat** : L'equipe peut evaluer la proposition et, si elle est validee, creer une PR pour ajouter le preset.

---

### Exemple 3 : Demande d'Aide pour un Workflow

**Scenario** : Un utilisateur ne parvient pas a configurer un workflow LTX avec un modele personnalise.

**Etapes** :
1. Ouvrir une nouvelle issue en utilisant le template `workflow_request.yml`.
2. Remplir le champ **Contexte** : "Je souhaite configurer un workflow LTX pour generer des videos avec un modele personnalise."
3. Remplir le champ **Configuration actuelle** :
   ```
   - ComfyUI : 0.9.5
   - LTX : 1.2.0
   - GPU : RTX 4070
   - Etapes deja realisees : Installation de ComfyUI et LTX, mais le workflow ne se charge pas.
   ```
4. Remplir le champ **Workflow souhaite** : "Un workflow qui charge un modele personnalise, genere une video de 5 secondes, et exporte le resultat en MP4."
5. Remplir le champ **Erreurs ou blocages** : "Erreur : 'Model not found'."
6. Remplir le champ **Environnement detaille** :
   ```
   - OS : Windows 11
   - ComfyUI : 0.9.5
   - LTX : 1.2.0
   - Python : 3.11
   - GPU : RTX 4070
   - Modele : custom_model.safetensors (place dans `models/checkpoints/`)
   ```
7. Ajouter le workflow JSON dans le champ **Fichiers utiles**.
8. Cocher les cases de la checklist.
9. Soumettre l'issue.

**Resultat** : Un mainteneur peut aider l'utilisateur a resoudre le probleme en verifiant le chemin du modele ou en proposant un workflow corrige.

---

## Annexes

- [Documentation Principale](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES#readme)
- [Guide de Validation Locale](docs/LOCAL_VALIDATION.md)
- [Modele de Maintenance GitHub](docs/GITHUB_MAINTENANCE.md)
- [Playbook du Mainteneur](docs/MAINTAINER_PLAYBOOK.md)

---

## Historique des Modifications

| Version | Date       | Auteur       | Modifications                          |
|---------|------------|--------------|----------------------------------------|
| 1.0     | 2026-06-03 | Mistral      | Creation du document.                  |

---

*Ce document est genere automatiquement et peut etre mis a jour par les contributeurs du projet.*
