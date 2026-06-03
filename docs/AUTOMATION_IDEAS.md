```markdown
# Idees d'Automatisation pour AI_VIDEO_WEBGL_COMPETENCES

Ce document recense des pistes d'automatisation **sans ajouter de dependances externes**, en s'appuyant sur les outils existants du depot : PowerShell, Bash, GitHub Actions, et les templates d'issues.

---

## 1. Preparation des Releases

### Objectif
Automatiser les etapes manuelles de preparation des releases (ex: `v1.2.3`) :
- Generation du changelog depuis les commits/PRs.
- Validation des assets (videos, contact sheets, logs).
- Bump de version dans les fichiers cles (ex: `README.md`, `docs/*.md`).
- Creation d'une issue de release avec checklist pre-remplie.

### Outils existants a reutiliser
- **GitHub Actions** : Workflow `validate-repo.yml` pour valider les assets.
- **Scripts locaux** : PowerShell/Bash pour bump de version (ex: `scripts/bump-version.ps1`).
- **Templates d'issues** : `feature_request.yml` pour structurer l'issue de release.

### Etapes proposees
1. **Script `scripts/prepare-release.ps1`** :
   - Lister les commits depuis la derniere release (via `git log`).
   - Generer un changelog partiel (format Markdown) en filtrant les messages conventionnels (ex: `feat:`, `fix:`).
   - Valider les assets via `validate-repo.yml` (ex: verifier la presence de fichiers `.mp4`, `.png`).
   - Mettre a jour les versions dans `README.md` et `docs/*.md` (ex: via `sed` ou PowerShell).
   - Creer une issue GitHub avec le template `feature_request.yml` pre-remplie (titre: `[Release] vX.Y.Z`, corps: changelog + checklist).

2. **Workflow GitHub** :
   - Ajouter un job dans `validate-repo.yml` pour executer `prepare-release.ps1` sur demande (via `workflow_dispatch`).
   - Publier le changelog genere en tant qu'artifact.

### Exemple de commande locale
```powershell
# Depuis la racine du depot
.
scripts\prepare-release.ps1 -Version "1.2.3" -DryRun
```

---

## 2. QA Media Automatisee (via Mistral)

### Objectif
Detecter automatiquement des artefacts dans les medias generes (videos, images) et suggerer des corrections via des issues ou PRs.

### Outils existants a reutiliser
- **Fichiers de reference** : `docs/CONTACT_SHEET_QA.md` et `docs/KNOWN_LIMITS.md` pour definir les criteres de qualite.
- **Templates d'issues** : `bug_report.yml` pour structurer les rapports de QA.
- **Scripts locaux** : PowerShell/Bash pour analyser les logs ou captures (ex: `scripts/qa-media.ps1`).

### Etapes proposees
1. **Script `scripts/qa-media.ps1`** :
   - Analyser les logs de generation (ex: sortie de ComfyUI) pour detecter des erreurs (ex: `CUDA out of memory`, `WebGL shader compilation failed`).
   - Comparer les metriques des medias generes (ex: resolution, FPS) avec les attentes (via `docs/CONTACT_SHEET_QA.md`).
   - Generer un rapport Markdown avec :
     - Liste des artefacts detectes (ex: flou, distorsion).
     - Suggestions de corrections (ex: reduire la resolution, ajuster les parametres ComfyUI).
   - Creer une issue GitHub avec le template `bug_report.yml` si des artefacts sont detectes.

2. **Integration dans les workflows** :
   - Ajouter un job dans `validate-repo.yml` pour executer `qa-media.ps1` apres chaque generation de media.
   - Publier le rapport QA en tant qu'artifact.

### Exemple de sortie
```markdown
## Rapport QA Media - `output/video_20260603.mp4`

### Artefacts detectes
- **Flou** : Present dans les 10 premieres secondes (seuil: 5% de pixels flous).
- **Distorsion** : Deformation visible a 00:00:15 (seuil: 2% de deviation).

### Suggestions
- Reduire la resolution de 1920x1080 a 1280x720.
- Ajuster les parametres ComfyUI : `noise_multiplier = 0.8`.

### Logs associes
```
[... logs de generation ...]
```

---

## 3. Tri Automatique des Issues et PRs

### Objectif
Automatiser le routage des issues et PRs vers les bonnes equipes (ex: ComfyUI, WebGL, Documentation) en utilisant des mots-cles et des labels.

### Outils existants a reutiliser
- **Templates d'issues** : `bug_report.yml`, `feature_request.yml`, `question.yml`.
- **Labels GitHub** : `bug`, `enhancement`, `question`, `ComfyUI`, `WebGL`, `Documentation`.
- **Workflow `validate-repo.yml`** : Pour valider les labels avant assignation.

### Etapes proposees
1. **Script `scripts/triage-issues.ps1`** :
   - Lister les issues/PRs ouvertes sans labels ou avec des labels generiques (ex: `bug`).
   - Analyser le titre et le corps pour detecter des mots-cles (ex: `ComfyUI`, `WebGL`, `Python`).
   - Ajouter des labels automatiquement en fonction des mots-cles :
     - `ComfyUI` si le mot-cle `ComfyUI` est present.
     - `WebGL` si le mot-cle `WebGL` ou `shader` est present.
     - `Documentation` si le mot-cle `docs` ou `README` est present.
   - Assigner l'issue/PR a un maintainer en fonction des labels (via l'API GitHub).

2. **Workflow GitHub** :
   - Ajouter un job dans `validate-repo.yml` pour executer `triage-issues.ps1` toutes les 6 heures (via `schedule`).
   - Envoyer une notification Slack/Teams si une issue est assignee a un maintainer.

### Exemple de mots-cles
| Mot-cle       | Label associe       | Maintainer assigne       |
|---------------|---------------------|--------------------------|
| ComfyUI       | `ComfyUI`           | `@maintainer-comfyui`    |
| WebGL         | `WebGL`             | `@maintainer-webgl`      |
| Python        | `bug`               | `@maintainer-core`       |
| docs          | `Documentation`     | `@maintainer-docs`       |

---

## 4. Validation des Scripts Locaux avant Commit

### Objectif
Bloquer les commits contenant des scripts non valides (ex: PowerShell avec des erreurs de syntaxe) via des hooks Git ou des workflows GitHub.

### Outils existants a reutiliser
- **Fichier `docs/LOCAL_VALIDATION.md`** : Decrit les scripts de validation locale.
- **Scripts locaux** : `scripts/validate-scripts.ps1` (a creer).
- **Hooks Git** : Pre-commit ou pre-push.

### Etapes proposees
1. **Script `scripts/validate-scripts.ps1`** :
   - Valider la syntaxe des scripts PowerShell/Bash :
     - Pour PowerShell : Utiliser `PSScriptAnalyzer` (module integre a PowerShell 7+).
     - Pour Bash : Utiliser `shellcheck` (si disponible) ou une validation basique (ex: verifier les `if` mal fermes).
   - Verifier que les scripts ont une extension coherente (ex: `.ps1` pour PowerShell, `.sh` pour Bash).
   - S'assurer que les scripts sont executables (pour Bash) ou ont les bons droits (pour PowerShell).
   - Generer un rapport de validation (format Markdown ou JSON).

2. **Hook Git (pre-commit)** :
   - Ajouter un hook dans `.git/hooks/pre-commit` (ou via `husky` si deja utilise) pour executer `validate-scripts.ps1` sur les fichiers modifies.
   - Si des erreurs sont detectees, bloquer le commit et afficher le rapport.

3. **Workflow GitHub** :
   - Ajouter un job dans `validate-repo.yml` pour executer `validate-scripts.ps1` sur tous les scripts du depot (via `workflow_dispatch`).

### Exemple de rapport
```markdown
## Validation des Scripts - `scripts/validate-scripts.ps1`

### Scripts analyses
- `scripts/generate-video.ps1` :  Valide (PSScriptAnalyzer).
- `scripts/qa-media.sh` :  Avertissement (ligne 42 : `if` non ferme).

### Recommandations
- Corriger le `if` non ferme dans `scripts/qa-media.sh`.
```

---

## 5. Generation de Rapports de Validation Automatiques

### Objectif
Automatiser la generation de rapports consolides pour les workflows GitHub, incluant :
- Temps d'execution des jobs.
- Nombre de succes/echecs.
- Metriques des medias generes (ex: resolution, FPS).

### Outils existants a reutiliser
- **Workflow `validate-repo.yml`** : Contient deja des jobs de validation.
- **Artifacts GitHub** : Pour stocker les rapports.
- **Issues GitHub** : Pour publier les rapports critiques.

### Etapes proposees
1. **Script `scripts/generate-validation-report.ps1`** :
   - Recuperer les logs des workflows GitHub (via l'API GitHub).
   - Extraire les metriques cles :
     - Temps d'execution par job.
     - Nombre de succes/echecs.
     - Metriques des medias (ex: taille des fichiers `.mp4`, nombre de frames).
   - Generer un rapport Markdown avec :
     - Un tableau recapitulatif.
     - Des graphiques ASCII (ex: `*` pour representer les temps d'execution).
   - Publier le rapport en tant qu'artifact.

2. **Workflow GitHub** :
   - Ajouter un job dans `validate-repo.yml` pour executer `generate-validation-report.ps1` apres chaque execution du workflow.
   - Creer une issue GitHub avec le rapport si des echecs critiques sont detectes (ex: 100% d'echecs).

### Exemple de rapport
```markdown
## Rapport de Validation - Workflow `validate-repo.yml` (2026-06-03)

### Temps d'execution
| Job               | Duree (s) | Statut   |
|-------------------|-----------|----------|
| validate-scripts  | 45        |  Succes |
| validate-media    | 120       |  Echec |
| validate-docs     | 30        |  Succes |

### Metriques des medias
- `output/video_1.mp4` : 1920x1080, 30 FPS, 10.5 Mo.
- `output/video_2.mp4` : 1280x720, 24 FPS, 5.2 Mo ( FPS inferieur a la cible).

### Recommandations
- Corriger l'echec du job `validate-media` (voir logs).
- Verifier la cible de FPS pour `output/video_2.mp4`.
```

---

## Annexes

### Commandes Utiles
```powershell
# Valider un script PowerShell
Invoke-ScriptAnalyzer -Path .\scripts\mon-script.ps1

# Lister les issues/PRs ouvertes
gh issue list --label "bug,ComfyUI"

# Recuperer les logs d'un workflow GitHub
gh run view <run-id> --log
```

### Ressources
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)
- [shellcheck](https://www.shellcheck.net/)
```
