# Validation Locale

Utiliser cette checklist avant d'ouvrir une pull request ou de pousser des changements de maintenance.

## 1. Verifier le Worktree

```powershell
git status --short
```

Relire chaque fichier modifie, ajoute ou supprime avant de commiter.

## 2. Verifier les Fichiers Requis

```powershell
$required = @(
  "README.md",
  "INSTALLATION.md",
  "CONCLUSIONS.md",
  "CONTRIBUTING.md",
  "SECURITY.md",
  "CITATION.cff",
  "examples/README.md",
  "codex-skills/video-start-end/SKILL.md",
  "codex-skills/webgl-right-video/SKILL.md",
  "cerveau-competence/competence-video-start-end-webgl/COMPETENCE.md"
)

foreach ($path in $required) {
  if (!(Test-Path $path)) {
    throw "Missing required file: $path"
  }
}

"required-files-ok"
```

Cette verification reprend l'esprit du workflow `.github/workflows/validate-repo.yml`.

## 3. Valider les JSON

```powershell
$jsonFiles = Get-ChildItem -Recurse -File -Include *.json
foreach ($file in $jsonFiles) {
  try {
    Get-Content -LiteralPath $file.FullName -Raw | ConvertFrom-Json | Out-Null
  } catch {
    throw "Invalid JSON: $($file.FullName)"
  }
}
"json-ok count=$($jsonFiles.Count)"
```

## 4. Valider les YAML GitHub

Si Python avec `PyYAML` est disponible, parser les templates GitHub et le workflow:

```powershell
@'
import pathlib, yaml
files = [
    pathlib.Path(".github/ISSUE_TEMPLATE/bug_report.yml"),
    pathlib.Path(".github/ISSUE_TEMPLATE/feature_request.yml"),
    pathlib.Path(".github/ISSUE_TEMPLATE/config.yml"),
    pathlib.Path(".github/workflows/validate-repo.yml"),
    pathlib.Path("CITATION.cff"),
]
for file in files:
    yaml.safe_load(file.read_text(encoding="utf-8"))
print(f"yaml-ok count={len(files)}")
'@ | python -
```

Si `PyYAML` n'est pas installe, Codex peut executer cette validation avec son chemin de dependances local.

## 5. Valider les Videos Modifiees

Pour un MP4 modifie:

```powershell
ffprobe -v error `
  -show_entries stream=width,height,nb_frames,r_frame_rate,duration `
  -show_entries format=duration,size `
  -of json .\examples\videos\<clip>.mp4
```

Pour la QA visuelle, creer ou mettre a jour une contact sheet et comparer debut, milieu et fin.

## 6. Verifier les Liens Markdown

Pour un changement documentaire:

- verifier que les liens relatifs pointent vers des fichiers existants;
- garder les chemins relatifs au depot;
- garder les commandes Windows copiables;
- mettre a jour `README.md` si une nouvelle documentation importante est ajoutee.

## 7. Checklist Securite

Avant commit:

- aucune cle API, token, mot de passe ou fichier `.env`;
- aucun chemin absolu prive sauf exemple clairement documente;
- aucun dossier de cache genere;
- aucun gros media sauf s'il prouve une decision technique;
- aucune commande ou option non supportee dans les docs.
