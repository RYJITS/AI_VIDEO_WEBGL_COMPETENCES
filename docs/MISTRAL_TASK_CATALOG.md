# Catalogue des Taches Mistral pour AI_VIDEO_WEBGL_COMPETENCES

Ce document recense les taches que Mistral peut accomplir pour soutenir le projet **AI_VIDEO_WEBGL_COMPETENCES**, en s'appuyant sur les structures existantes (templates GitHub, checklists, rapports de delegation, etc.).

---

## 1. Generation de Documentation

### 1.1. Fiches Techniques et Guides
**Description** : Redaction de fiches techniques pour des competences, workflows ou outils specifiques (ex : configuration ComfyUI, integration WebGL, optimisation GPU).
**Inputs** :
- Titre ou sujet de la fiche.
- Contexte ou lien vers des ressources existantes.
- Liste des points cles a couvrir (ex : prerequis, etapes, exemples).
- Style demande (technique, pedagogique, etc.).

**Outputs** :
- Fichier Markdown pret a etre integre dans `docs/` (ex : `docs/COMFYUI_SETUP_CHECKLIST.md`).
- Respect des conventions du projet (titres, sections, exemples de code).

**Codex Checks** :
- Verifier que le fichier respecte la structure des documents existants (ex : `docs/REVIEW_CHECKLIST.md`).
- S'assurer que les exemples de code ou commandes sont valides et reproductibles.
- Confirmer que les liens vers des ressources externes sont pertinents et fonctionnels.

**Quand ne pas deleguer** :
- Si la tache necessite une validation experimentale (ex : benchmarking GPU).
- Si le sujet est trop specifique ou necessite des connaissances internes non documentees.

---

### 1.2. Mises a Jour de Documentation Existante
**Description** : Mise a jour de fichiers existants (ex : `README.md`, `CONTRIBUTING.md`, `docs/FAQ.md`) pour refleter des changements recents ou ajouter des precisions.
**Inputs** :
- Liste des sections a mettre a jour.
- Contexte des changements (ex : nouvelle version de ComfyUI, ajout d'une competence).
- Style ou ton a respecter (ex : technique, accessible).

**Outputs** :
- Version revisee du fichier Markdown.
- Liste des modifications apportees (pour tracabilite).

**Codex Checks** :
- Verifier que les modifications ne cassent pas les liens internes ou externes.
- Confirmer que les exemples ou commandes sont toujours valides.
- S'assurer que le ton et le style sont coherents avec le reste du document.

**Quand ne pas deleguer** :
- Si la mise a jour necessite des tests ou une validation par l'equipe.

---

## 2. Templates GitHub

### 2.1. Creation de Templates pour Issues/PRs
**Description** : Generation de templates pour les issues ou pull requests, adaptes a des cas d'usage specifiques (ex : demande de workflow, rapport de bug video, question sur une competence).
**Inputs** :
- Type de template (issue/PR).
- Liste des sections a inclure (ex : contexte, etapes de reproduction, environnement).
- Style ou ton (ex : formel, technique).

**Outputs** :
- Fichier YAML ou Markdown pret a etre place dans `.github/ISSUE_TEMPLATE/` ou `.github/pull_request_template.md`.
- Respect des conventions du projet (ex : utilisation de `validations.required` pour les champs obligatoires).

**Codex Checks** :
- Verifier que le template est conforme aux standards GitHub (ex : utilisation de `type: textarea` pour les champs longs).
- Confirmer que les sections obligatoires sont marquees comme `required`.
- S'assurer que le template ne contient pas de champs redondants ou inutiles.

**Quand ne pas deleguer** :
- Si le template necessite une validation par la communaute ou l'equipe principale.

---

### 2.2. Adaptation de Templates Existants
**Description** : Modification de templates existants pour les rendre plus clairs, complets ou adaptes a de nouveaux cas d'usage.
**Inputs** :
- Template a modifier (ex : `bug_report.yml`).
- Liste des sections a ajouter, supprimer ou reformuler.
- Contexte des changements (ex : nouveau type de bug rapporte).

**Outputs** :
- Version revisee du template.
- Justification des modifications.

**Codex Checks** :
- Verifier que les modifications ne cassent pas la compatibilite avec les issues existantes.
- Confirmer que les nouveaux champs sont optionnels ou clairement documentes.

**Quand ne pas deleguer** :
- Si la modification impacte des processus critiques (ex : triage des issues).

---

## 3. Checklists et Rapports

### 3.1. Checklists de Revue (Review Checklists)
**Description** : Creation de checklists pour les revues de code, de workflows ou de documentation. Ces checklists aident a standardiser les revues et a reduire les erreurs.
**Inputs** :
- Type de checklist (ex : revue de PR, revue de workflow ComfyUI, revue de documentation).
- Liste des points a verifier (ex : validite JSON, respect des conventions, tests fonctionnels).
- Style ou format (ex : liste a cocher, tableau).

**Outputs** :
- Fichier Markdown pret a etre integre dans `docs/` (ex : `docs/REVIEW_CHECKLIST.md`).
- Format clair et actionnable.

**Codex Checks** :
- Verifier que la checklist couvre tous les aspects critiques du type de revue.
- Confirmer que les points sont formules de maniere claire et non ambigue.
- S'assurer que la checklist est concise et facile a suivre.

**Quand ne pas deleguer** :
- Si la checklist necessite une validation par des experts du domaine.

---

### 3.2. Rapports de Validation (Validation Reports)
**Description** : Generation de rapports de validation pour des workflows, des scripts ou des configurations. Ces rapports incluent des tests, des logs et des conclusions.
**Inputs** :
- Type de rapport (ex : validation de workflow ComfyUI, validation de script Python).
- Contexte et objectifs du rapport.
- Resultats des tests (logs, captures d'ecran, metriques).

**Outputs** :
- Fichier Markdown ou JSON structure (ex : `docs/LOCAL_VALIDATION.md`).
- Sections claires : contexte, methodologie, resultats, conclusions.

**Codex Checks** :
- Verifier que les resultats sont reproductibles et documentes.
- Confirmer que les logs ou captures sont anonymises et pertinents.
- S'assurer que les conclusions sont etayees par les donnees.

**Quand ne pas deleguer** :
- Si la validation necessite des ressources materielles specifiques (ex : GPU haut de gamme).

---

## 4. Analyse de Workflows JSON

### 4.1. Audit de Workflows ComfyUI
**Description** : Analyse de workflows ComfyUI (fichiers JSON) pour identifier des problemes, des optimisations ou des incoherences. Generation d'un rapport d'audit.
**Inputs** :
- Fichier workflow JSON a analyser.
- Contexte ou objectifs de l'audit (ex : performance, compatibilite).
- Liste des points a verifier (ex : nuds obsoletes, dependances manquantes).

**Outputs** :
- Rapport d'audit structure (Markdown ou JSON) avec :
  - Liste des problemes identifies.
  - Recommandations d'optimisation.
  - Exemples de corrections (si applicable).

**Codex Checks** :
- Verifier que l'analyse couvre tous les aspects critiques (ex : nuds, connexions, parametres).
- Confirmer que les recommandations sont realisables et documentees.
- S'assurer que le rapport est clair et actionnable.

**Quand ne pas deleguer** :
- Si l'audit necessite une execution reelle du workflow pour valider les resultats.

---

### 4.2. Generation de Workflows Exemples
**Description** : Creation de workflows ComfyUI exemples pour des cas d'usage specifiques (ex : generation video, integration WebGL, post-traitement).
**Inputs** :
- Description du cas d'usage.
- Liste des nuds et parametres a inclure.
- Style ou format (ex : workflow minimaliste, workflow complet).

**Outputs** :
- Fichier JSON de workflow pret a l'emploi.
- Documentation associee (ex : description des etapes, prerequis).

**Codex Checks** :
- Verifier que le workflow est valide et peut etre importe dans ComfyUI.
- Confirmer que les nuds et parametres sont a jour et compatibles.
- S'assurer que la documentation est claire et complete.

**Quand ne pas deleguer** :
- Si le workflow necessite des tests avec des modeles specifiques ou des ressources materielles.

---

## 5. Redaction de Prompts et Guides

### 5.1. Brouillons de Prompts pour Generation Video
**Description** : Redaction de prompts pour des outils de generation video (ex : ComfyUI, Wan/LTX), incluant des exemples de parametres et des conseils d'optimisation.
**Inputs** :
- Objectif du prompt (ex : generation d'une video stylisee, integration d'effets WebGL).
- Style ou ton (ex : technique, creatif).
- Liste des parametres a inclure (ex : modele, steps, CFG, resolution).

**Outputs** :
- Fichier Markdown ou JSON avec :
  - Exemples de prompts.
  - Parametres recommandes.
  - Conseils d'optimisation.

**Codex Checks** :
- Verifier que les exemples de prompts sont reproductibles et documentes.
- Confirmer que les parametres sont coherents avec les capacites des outils.
- S'assurer que les conseils sont bases sur des bonnes pratiques.

**Quand ne pas deleguer** :
- Si le prompt necessite des tests avec des modeles specifiques ou des ressources limitees.

---

### 5.2. Guides d'Utilisation pour Competences Specifiques
**Description** : Creation de guides d'utilisation pour des competences specifiques (ex : integration WebGL, utilisation de scripts Python, configuration de ComfyUI).
**Inputs** :
- Titre ou sujet du guide.
- Liste des etapes ou concepts a couvrir.
- Style ou ton (ex : pedagogique, technique).

**Outputs** :
- Fichier Markdown pret a etre integre dans `docs/` (ex : `docs/WEBGL_INTEGRATION_GUIDE.md`).
- Format clair avec exemples et captures d'ecran si necessaire.

**Codex Checks** :
- Verifier que le guide couvre tous les aspects critiques de la competence.
- Confirmer que les exemples ou commandes sont valides et reproductibles.
- S'assurer que le ton est adapte au public cible.

**Quand ne pas deleguer** :
- Si le guide necessite des tests ou une validation par des experts.

---

## 6. Resumes et Syntheses

### 6.1. Resumes de QA (Quality Assurance)
**Description** : Generation de resumes de tests QA pour des workflows, des scripts ou des configurations. Ces resumes incluent les resultats, les problemes identifies et les recommandations.
**Inputs** :
- Contexte des tests (ex : validation d'un workflow ComfyUI).
- Resultats bruts (logs, captures, metriques).
- Liste des problemes a inclure.

**Outputs** :
- Fichier Markdown structure avec :
  - Contexte et objectifs.
  - Resultats des tests.
  - Problemes identifies.
  - Recommandations.

**Codex Checks** :
- Verifier que les resultats sont complets et documentes.
- Confirmer que les problemes sont clairement identifies et priorises.
- S'assurer que les recommandations sont actionnables.

**Quand ne pas deleguer** :
- Si les tests necessitent des ressources ou des competences specifiques.

---

### 6.2. Syntheses de Discussions ou Issues
**Description** : Redaction de syntheses pour des discussions techniques, des threads GitHub ou des issues complexes. Ces syntheses aident a clarifier les decisions et les prochaines etapes.
**Inputs** :
- Contexte de la discussion ou de l'issue.
- Liste des points cles a synthetiser.
- Objectif de la synthese (ex : decision technique, plan d'action).

**Outputs** :
- Fichier Markdown ou JSON structure avec :
  - Resume des points cles.
  - Decisions prises.
  - Prochaines etapes.

**Codex Checks** :
- Verifier que la synthese est fidele au contenu original.
- Confirmer que les decisions et prochaines etapes sont claires et actionnables.
- S'assurer que le ton est neutre et professionnel.

**Quand ne pas deleguer** :
- Si la synthese necessite une validation par l'equipe ou la communaute.

---

## 7. Tri des Issues et Roadmaps

### 7.1. Tri des Issues GitHub
**Description** : Analyse et tri des issues GitHub pour identifier les priorites, les doublons ou les problemes recurrents. Generation d'un rapport de tri.
**Inputs** :
- Liste des issues a analyser (ou acces au depot GitHub).
- Criteres de tri (ex : labels, priorite, statut).
- Objectif du tri (ex : nettoyage du backlog, identification des bugs critiques).

**Outputs** :
- Rapport structure (Markdown ou JSON) avec :
  - Liste des issues triees par priorite.
  - Problemes recurrents identifies.
  - Recommandations (ex : fusion, fermeture, assignation).

**Codex Checks** :
- Verifier que l'analyse couvre tous les aspects critiques (ex : labels, statut, priorite).
- Confirmer que les recommandations sont realistes et documentees.
- S'assurer que le rapport est clair et actionnable.

**Quand ne pas deleguer** :
- Si le tri necessite une validation par l'equipe principale.

---

### 7.2. Redaction de Roadmaps
**Description** : Creation de roadmaps pour des fonctionnalites, des competences ou des ameliorations du projet. Ces roadmaps incluent des etapes, des dependances et des echeances.
**Inputs** :
- Objectif de la roadmap (ex : roadmap pour une nouvelle competence WebGL).
- Liste des etapes ou fonctionnalites a inclure.
- Style ou format (ex : timeline, tableau Kanban).

**Outputs** :
- Fichier Markdown ou JSON pret a etre integre dans `docs/` (ex : `docs/ROADMAP_WEBGL.md`).
- Format clair avec echeances et dependances.

**Codex Checks** :
- Verifier que la roadmap couvre tous les aspects critiques du projet.
- Confirmer que les etapes sont realistes et documentees.
- S'assurer que le format est adapte au public cible.

**Quand ne pas deleguer** :
- Si la roadmap necessite une validation par l'equipe ou les parties prenantes.

---

## 8. Notes de Version (Release Notes)

### 8.1. Redaction de Notes de Version
**Description** : Generation de notes de version pour des releases du projet. Ces notes incluent les changements, les corrections de bugs et les ameliorations.
**Inputs** :
- Liste des changements a inclure (ex : nouvelles fonctionnalites, corrections de bugs).
- Style ou ton (ex : technique, accessible).
- Format (ex : Markdown, HTML).

**Outputs** :
- Fichier Markdown pret a etre integre dans le depot (ex : `docs/RELEASE_NOTES_vX.Y.Z.md`).
- Format clair avec sections pour les changements, les bugs et les ameliorations.

**Codex Checks** :
- Verifier que les notes couvrent tous les changements critiques.
- Confirmer que les bugs corriges sont clairement identifies.
- S'assurer que le ton est adapte au public cible.

**Quand ne pas deleguer** :
- Si les notes necessitent une validation par l'equipe ou les utilisateurs finaux.

---

## 9. Limites et Recommandations

### 9.1. Quand ne pas deleguer a Mistral
Mistral ne doit **pas** etre utilise pour les taches suivantes :
- **Validation experimentale** : Tests necessitant des ressources materielles specifiques (ex : benchmarking GPU, tests de performance sur des modeles lourds).
- **Decisions strategiques** : Choix techniques critiques (ex : architecture d'un nouveau workflow, selection de modeles).
- **Gestion de communaute** : Reponses a des questions sensibles ou moderation de discussions.
- **Acces a des ressources privees** : Manipulation de fichiers `.env`, tokens ou chemins sensibles.
- **Taches necessitant des secrets** : Toute operation impliquant des informations non publiques.

### 9.2. Bonnes Pratiques pour la Delegation
- **Preciser les inputs** : Fournir des exemples, des contraintes et des objectifs clairs.
- **Valider les outputs** : Toujours verifier que les fichiers generes sont valides, complets et conformes aux standards du projet.
- **Documenter les limites** : Indiquer clairement ce que Mistral peut ou ne peut pas faire pour une tache donnee.
- **Utiliser les templates existants** : S'appuyer sur les structures documentaires deja en place (ex : `docs/REVIEW_CHECKLIST.md`).

---

## 10. Exemples Concrets

### Exemple 1 : Generation d'une Fiche Technique
**Tache** : Creer une fiche technique pour configurer ComfyUI avec un modele specifique.
**Inputs** :
- Titre : "Configuration de ComfyUI pour Stable Diffusion 1.5"
- Points cles : Prerequis, etapes d'installation, parametres recommandes, exemples de workflows.
- Style : Technique mais accessible.

**Output** :
```markdown
# Configuration de ComfyUI pour Stable Diffusion 1.5

## Prerequis
- ComfyUI installe et fonctionnel.
- GPU compatible (ex : RTX 3060 ou superieur).
- Modele Stable Diffusion 1.5 telecharge (fichier `.ckpt`).

## Etapes d'Installation
1. Placer le modele dans `ComfyUI/models/checkpoints/`.
2. Lancer ComfyUI avec `python main.py`.
3. Importer le workflow exemple depuis `examples/sd15_workflow.json`.

## Parametres Recommandes
- **Steps** : 20-30
- **CFG** : 7-10
- **Resolution** : 512x512 ou 768x768
- **Modele** : `sd15.safetensors`

## Exemple de Workflow
[Lien vers un workflow JSON valide]
```

**Codex Checks** :
- Verifier que les etapes sont reproductibles.
- Confirmer que les parametres sont coherents avec les bonnes pratiques.
- S'assurer que le workflow exemple est valide.

---

### Exemple 2 : Audit d'un Workflow JSON
**Tache** : Analyser un workflow ComfyUI pour identifier des problemes de performance.
**Inputs** :
- Fichier workflow : `workflows/optimize_video.json`
- Points a verifier : Nuds obsoletes, dependances manquantes, parametres inefficaces.

**Output** :
```markdown
# Audit du Workflow `optimize_video.json`

## Problemes Identifies
1. **Nud obsolete** : `VAEEncode` remplace par `VAEEncodeForInpaint` dans les versions recentes.
2. **Dependance manquante** : Le nud `ImageScale` utilise un algorithme non standard (`nearest_exact`).
3. **Parametre inefficace** : `steps=50` trop eleve pour une previsualisation rapide.

## Recommandations
1. Remplacer `VAEEncode` par `VAEEncodeForInpaint`.
2. Utiliser `bilinear` ou `lanczos` pour `ImageScale`.
3. Reduire `steps` a 15-20 pour les tests.

## Workflow Corrige
[Lien vers une version corrigee du fichier JSON]
```

**Codex Checks** :
- Verifier que les nuds corriges sont compatibles avec la version de ComfyUI utilisee.
- Confirmer que les parametres recommandes sont optimaux pour le cas d'usage.
- S'assurer que le workflow corrige est fonctionnel.

---

## Annexes

### A. Conventions du Projet
- **Noms de fichiers** : Utiliser des noms descriptifs en kebab-case (ex : `setup-comfyui-guide.md`).
- **Titres** : Utiliser des titres hierarchises (ex : `# Titre 1`, `## Titre 2`).
- **Code** : Toujours inclure des exemples de code ou de commandes dans des blocs dedies.
- **Liens** : Privilegier les liens relatifs pour les ressources internes.

### B. Outils Recommandes pour la Validation
- **Markdown** : Utiliser [Markdownlint](https://github.com/DavidAnson/markdownlint) pour valider la syntaxe.
- **JSON** : Utiliser [JSONLint](https://jsonlint.com/) pour valider les fichiers JSON.
- **GitHub** : Verifier que les fichiers respectent les templates existants (ex : `.github/ISSUE_TEMPLATE/bug_report.yml`).

### C. Ressources Utiles
- [Documentation ComfyUI](https://docs.comfy.org/)
- [Guide GitHub](https://docs.github.com/fr)
- [Markdown Guide](https://www.markdownguide.org/)

---

**Derniere mise a jour** : 2026-06-03
**Responsable** : Mistral (via delegation Codex)
