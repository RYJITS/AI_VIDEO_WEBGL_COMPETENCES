# Securisation du Contexte Projet pour Mistral

## Objectif
Ce document definit les regles et processus pour preparer un contexte projet securise et minimal avant de l'envoyer a Mistral. L'objectif est d'exclure systematiquement les secrets, les donnees sensibles et les fichiers non pertinents, tout en garantissant que le contexte fourni est suffisant pour une assistance efficace.

---

## 1. Principes Fondamentaux

### 1.1. Minimalisme
Seuls les fichiers **strictement necessaires** a la comprehension du probleme ou de la demande doivent etre inclus. Chaque fichier ajoute augmente le risque de fuite de donnees sensibles.

### 1.2. Exclusion des Secrets
Aucun secret ne doit etre transmis, y compris :
- Cles API (OpenAI, Mistral, etc.)
- Identifiants de connexion (GitHub, Docker Hub, etc.)
- Chemins de fichiers locaux contenant des donnees sensibles
- Variables d'environnement personnalisees
- Fichiers de configuration avec des mots de passe ou tokens

### 1.3. Preuve de Pertinence
Chaque fichier inclus doit avoir une justification claire dans le contexte fourni. Par exemple :
- Un workflow ComfyUI pour un probleme de pipeline video
- Un fichier de configuration pour un probleme d'installation
- Un extrait de log pour un probleme de runtime

---

## 2. Filtrage par Type de Fichier

### 2.1. Fichiers a Exclure Systematiquement
| Type de Fichier | Raison | Exemple de Chemin |
|-----------------|--------|-------------------|
| Fichiers binaires | Contiennent souvent des donnees sensibles ou sont inutiles pour le texte | `*.bin`, `*.exe`, `*.dll` |
| Fichiers de cache | Peuvent contenir des donnees temporaires sensibles | `.cache/`, `__pycache__/` |
| Fichiers de logs complets | Trop volumineux et souvent redondants | `logs/*.log` (sauf extraits cibles) |
| Fichiers de configuration utilisateur | Peuvent contenir des chemins locaux ou des preferences personnelles | `.env`, `.vscode/settings.json` |
| Fichiers de dependances | Inutiles pour le contexte technique | `node_modules/`, `venv/` |
| Fichiers de build | Generes automatiquement et souvent volumineux | `dist/`, `build/` |

### 2.2. Fichiers a Inclure avec Precaution
| Type de Fichier | Conditions d'Inclusion | Exemple de Chemin |
|-----------------|------------------------|-------------------|
| Fichiers de configuration technique | Doivent etre anonymises (suppression des secrets) | `comfyui_config.json` (sans tokens) |
| Workflows ComfyUI | Doivent etre minimaux et cibles | `workflows/video_pipeline.json` |
| Scripts personnalises | Doivent etre commentes et pertinents | `scripts/preprocess_video.py` |
| Fichiers de manifeste | Doivent etre reduits aux dependances critiques | `package.json` (sans versions exactes si non pertinentes) |
| Extraits de logs | Doivent etre anonymises et cibles | `logs/error_2024-06-03.txt` (sans IPs ou chemins locaux) |

### 2.3. Fichiers a Inclure par Defaut
| Type de Fichier | Justification | Exemple de Chemin |
|-----------------|---------------|-------------------|
| Fichiers de documentation technique | Pour comprendre l'architecture | `docs/*.md` (hors README.md si trop volumineux) |
| Fichiers de template d'issues | Pour comprendre les processus | `.github/ISSUE_TEMPLATE/*.yml` |
| Fichiers de workflow GitHub | Pour comprendre les pipelines CI/CD | `.github/workflows/*.yml` |
| Fichiers de contribution | Pour comprendre les regles de contribution | `CONTRIBUTING.md` |
| Fichiers de securite | Pour comprendre les politiques de securite | `SECURITY.md` |

---

## 3. Processus de Filtrage

### 3.1. Verification Manuelle
1. **Lister tous les fichiers** du projet qui pourraient etre pertinents.
2. **Appliquer les regles d'exclusion** (section 2.1).
3. **Anonymiser les fichiers** (section 3.2) si necessaire.
4. **Verifier les dependances** : ne garder que les fichiers strictement necessaires.
5. **Documenter les exclusions** : expliquer pourquoi chaque fichier a ete exclu ou inclus.

### 3.2. Anonymisation des Fichiers
Pour les fichiers contenant des donnees sensibles mais potentiellement utiles :
- **Remplacer les secrets** par des placeholders generiques :
  - `"api_key": "REDACTED"`
  - `"password": "[MOT_DE_PASSE]"`
  - `"token": "[TOKEN]"`
- **Supprimer les chemins locaux** : remplacer par des chemins generiques :
  - `"C:\Users\user\Documents\..."`  `"[CHEMIN_LOCAL]"`
- **Supprimer les adresses IP** : remplacer par `[IP]` ou `[ADRESSE_IP]`
- **Supprimer les noms d'utilisateur** : remplacer par `[UTILISATEUR]`

### 3.3. Validation du Contexte
Avant d'envoyer le contexte a Mistral :
1. **Verifier la taille** : le contexte ne doit pas depasser **9000 octets** (limite actuelle).
2. **Verifier l'absence de secrets** : utiliser des outils comme `git-secrets` ou des regex pour detecter les patterns de secrets.
3. **Verifier la pertinence** : chaque fichier doit avoir une justification claire dans le message accompagnant le contexte.
4. **Verifier la lisibilite** : le contexte doit etre structure et facile a lire.

---

## 4. Exemples Concrets

### 4.1. Cas 1 : Probleme de Workflow ComfyUI
**Contexte a envoyer :**
- `.github/workflows/validate-repo.yml` (workflow CI/CD)
- `workflows/video_pipeline.json` (workflow specifique)
- `docs/COMFYUI_SETUP_CHECKLIST.md` (documentation d'installation)
- `CONTRIBUTING.md` (regles de contribution)

**Fichiers exclus :**
- `node_modules/` (trop volumineux)
- `.env` (contient des secrets)
- `logs/comfyui_full.log` (trop volumineux)
- `venv/` (dependances inutiles)

**Message accompagnant :**
```
Contexte pour un probleme de workflow ComfyUI :
- Le workflow `video_pipeline.json` ne s'execute pas correctement.
- Voici le workflow CI/CD utilise pour valider les modifications.
- La documentation d'installation est fournie pour contexte.
- Les regles de contribution expliquent comment contribuer au projet.
```

### 4.2. Cas 2 : Probleme d'Installation
**Contexte a envoyer :**
- `CONTRIBUTING.md` (regles d'installation)
- `docs/COMFYUI_SETUP_CHECKLIST.md` (checklist d'installation)
- `.github/ISSUE_TEMPLATE/bug_report.yml` (template de rapport de bug)
- `SECURITY.md` (politique de securite)

**Fichiers exclus :**
- `README.md` (trop volumineux)
- `scripts/install.ps1` (contient des chemins locaux)
- `venv/` (dependances inutiles)
- `.vscode/settings.json` (preferences personnelles)

**Message accompagnant :**
```
Contexte pour un probleme d'installation de ComfyUI :
- Le template de rapport de bug explique comment signaler un probleme.
- La checklist d'installation detaille les etapes necessaires.
- Les regles de contribution incluent des instructions d'installation.
- La politique de securite est fournie pour contexte.
```

### 4.3. Cas 3 : Probleme de Pipeline Video
**Contexte a envoyer :**
- `workflows/video_pipeline.json` (workflow specifique)
- `scripts/preprocess_video.py` (script personnalise)
- `docs/AUTOMATION_IDEAS.md` (idees d'automatisation)
- `.github/ISSUE_TEMPLATE/workflow_request.yml` (template de demande de workflow)

**Fichiers exclus :**
- `assets/videos/sample.mp4` (donnees sensibles)
- `.git/config` (contient des URLs de depot)
- `logs/preprocess.log` (trop volumineux)
- `node_modules/` (dependances inutiles)

**Message accompagnant :**
```
Contexte pour un probleme de pipeline video :
- Le workflow `video_pipeline.json` est utilise pour generer la video.
- Le script `preprocess_video.py` prepare les donnees d'entree.
- Les idees d'automatisation expliquent les objectifs du pipeline.
- Le template de demande de workflow montre comment demander des ameliorations.
```

---

## 5. Outils et Automatisation

### 5.1. Outils Recommandes
| Outil | Utilisation | Lien |
|-------|-------------|------|
| `git-secrets` | Detecter les secrets dans les fichiers | [GitHub - git-secrets](https://github.com/awslabs/git-secrets) |
| `truffleHog` | Scanner les depots Git pour les secrets | [GitHub - truffleHog](https://github.com/trufflesecurity/truffleHog) |
| `grep` | Rechercher des patterns de secrets | `grep -r "password\|token\|api_key" .` |
| `jq` | Manipuler les fichiers JSON pour l'anonymisation | [Manpage jq](https://stedolan.github.io/jq/manual/) |

### 5.2. Scripts d'Aide
Un script PowerShell ou Bash peut etre utilise pour automatiser le filtrage. Exemple minimal :

**PowerShell (exemple) :**
```powershell
# Exemple de script pour filtrer les fichiers sensibles
$filesToExclude = @(
    "*.bin", "*.exe", "*.dll",
    "node_modules/*", "venv/*",
    ".cache/*", "__pycache__/*",
    "logs/*.log", ".env", ".git/config"
)

# Filtrer les fichiers en fonction des exclusions
Get-ChildItem -Recurse | Where-Object { $_.FullName -notmatch ($filesToExclude -join "|`) } | 
    Where-Object { $_.Length -lt 4500 } | 
    Select-Object -First 5
```

**Bash (exemple) :**
```bash
#!/bin/bash
# Exemple de script pour filtrer les fichiers sensibles
find . -type f -not -path "./node_modules/*" -not -path "./venv/*" -not -path "./.git/*" | \
    grep -v -E "\.(bin|exe|dll|log)$" | \
    grep -v -E "(node_modules|venv|__pycache__|\.cache)" | \
    grep -v -E "(password|token|api_key)" | \
    head -n 5
```

---

## 6. Bonnes Pratiques pour les Demandes a Mistral

### 6.1. Message d'Accompagnement
Le message accompagnant le contexte doit :
1. **Decrire le probleme** de maniere claire et concise.
2. **Lister les fichiers inclus** avec une breve justification.
3. **Expliquer les exclusions** (si necessaire).
4. **Poser une question precise** a Mistral.

**Exemple de message :**
```
Bonjour Mistral,

Je rencontre un probleme avec le workflow `video_pipeline.json` dans ComfyUI. Voici le contexte :

**Fichiers inclus :**
- `workflows/video_pipeline.json` : Workflow qui ne s'execute pas correctement.
- `.github/workflows/validate-repo.yml` : Workflow CI/CD utilise pour valider les modifications.
- `docs/COMFYUI_SETUP_CHECKLIST.md` : Documentation d'installation.

**Fichiers exclus :**
- `node_modules/` : Trop volumineux.
- `.env` : Contient des secrets.
- `logs/comfyui_full.log` : Trop volumineux.

**Probleme :**
Le workflow `video_pipeline.json` echoue avec l'erreur suivante :
```
Error: Node "VideoLoader" not found in the workflow.
```

Pouvez-vous m'aider a diagnostiquer ce probleme ?

Merci d'avance !
```

### 6.2. Questions a Poser a Mistral
- **Diagnostic** : "Quelle est la cause probable de cette erreur ?"
- **Solution** : "Comment puis-je corriger ce probleme ?"
- **Amelioration** : "Quelles sont les bonnes pratiques pour configurer ce type de workflow ?"
- **Validation** : "Comment puis-je verifier que la solution fonctionne ?"

### 6.3. Reponses Attendues
Mistral devrait fournir :
- Une analyse claire du probleme.
- Des etapes de correction precises.
- Des references a la documentation pertinente.
- Des exemples de code ou de configuration (si applicable).

---

## 7. Annexes

### 7.1. Liste des Secrets Courants a Exclure
| Type de Secret | Exemple de Pattern | Action |
|----------------|--------------------|--------|
| Cle API | `api_key`, `API_KEY`, `token` | Remplacer par `[CLE_API]` |
| Mot de passe | `password`, `pwd` | Remplacer par `[MOT_DE_PASSE]` |
| Token | `token`, `access_token` | Remplacer par `[TOKEN]` |
| Chemin local | `C:\`, `/home/`, `Users/` | Remplacer par `[CHEMIN_LOCAL]` |
| Adresse IP | `192.168.`, `127.0.0.1` | Remplacer par `[IP]` |
| Nom d'utilisateur | `user`, `username` | Remplacer par `[UTILISATEUR]` |

### 7.2. Exemple de Fichier Anonymise
**Avant :**
```json
{
  "api_key": "sk-1234567890abcdef",
  "password": "MonMotDePasse123!",
  "token": "ghp_abcdef1234567890",
  "local_path": "C:\Users\monutilisateur\Documents\projet"
}
```

**Apres :**
```json
{
  "api_key": "[CLE_API]",
  "password": "[MOT_DE_PASSE]",
  "token": "[TOKEN]",
  "local_path": "[CHEMIN_LOCAL]"
}
```

### 7.3. Ressources Utiles
- [Documentation GitHub sur les secrets](https://docs.github.com/en/code-security/secret-scanning/about-secret-scanning)
- [Guide de securisation des depots Git](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/about-secret-scanning)
- [Bonnes pratiques pour les workflows ComfyUI](https://github.com/comfyanonymous/ComfyUI)

---

## 8. Historique des Modifications

| Version | Date | Auteur | Modifications |
|---------|------|--------|---------------|
| 1.0 | 03/06/2026 | Mistral | Creation du document |

---

## 9. Licence
Ce document est fourni sous licence [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). Vous etes libre de le partager et de l'adapter, sous reserve de crediter l'auteur et de partager sous la meme licence.

---

*Ce document est un guide evolutif. N'hesitez pas a proposer des ameliorations via une issue ou une pull request.*
