```markdown
# Contrats JSON pour les sorties des actions Mistral

Ce document definit les **contrats JSON stricts** que les sorties des actions du projet **AI_VIDEO_WEBGL_COMPETENCES** doivent respecter. Ces contrats garantissent la coherence, la validation et l'interoperabilite des donnees generees par les workflows ComfyUI et les competences associees.

---

## 1. Introduction

Les actions du projet (ex : generation de videos, integration WebGL, traitement ComfyUI) produisent des sorties structurees en JSON. Ces sorties sont consommees par des scripts, des workflows ou des interfaces utilisateur. **Toute sortie non conforme a ces contrats sera rejetee par les validateurs automatiques.**

Ce document couvre :
- Les **formes acceptees** (shapes) des objets JSON.
- Les **formes rejetees** avec exemples.
- Les **regles de validation** (parse, schema, logique metier).
- Les **erreurs courantes** et leur resolution.

---

## 2. Contrats de base

### 2.1. Structure racine obligatoire

Toute sortie JSON **doit** respecter la structure suivante :

```json
{
  "status": "success|error|warning",
  "data": { ... },
  "metadata": {
    "timestamp": "ISO-8601",
    "action": "nom_de_l_action",
    "version": "X.Y.Z"
  },
  "errors": [ ... ]
}
```

#### Regles :
- **`status`** : Valeur obligatoire parmi `success`, `error`, ou `warning`.
- **`data`** : Objet contenant les resultats de l'action (peut etre `null` si `status` est `error`).
- **`metadata`** : Metadonnees obligatoires.
  - `timestamp` : Horodatage au format ISO-8601 (ex : `2026-06-03T17:45:26.123Z`).
  - `action` : Nom de l'action executee (ex : `generate_video`, `webgl_integration`).
  - `version` : Version du contrat JSON (ex : `1.0.0`).
- **`errors`** : Tableau de chaines de caracteres decrivant les erreurs (vide si `status` est `success`).

#### Exemple valide :
```json
{
  "status": "success",
  "data": {
    "video_id": "vid_12345",
    "duration": 120.5,
    "resolution": "1920x1080"
  },
  "metadata": {
    "timestamp": "2026-06-03T17:45:26.123Z",
    "action": "generate_video",
    "version": "1.0.0"
  },
  "errors": []
}
```

---

## 3. Contrats par type d'action

### 3.1. Action : `generate_video`

#### Forme acceptee :
```json
{
  "video_id": "string (UUID ou hash)",
  "duration": "number (secondes, >= 0)",
  "resolution": "string (ex: '1920x1080')",
  "fps": "number (>= 0)",
  "codec": "string (ex: 'h264', 'vp9')",
  "file_path": "string (chemin absolu ou relatif)",
  "size_bytes": "number (>= 0)",
  "thumbnails": [
    {
      "path": "string",
      "width": "number",
      "height": "number"
    }
  ]
}
```

#### Exemple valide :
```json
{
  "video_id": "vid_abc123",
  "duration": 120.5,
  "resolution": "1920x1080",
  "fps": 30,
  "codec": "h264",
  "file_path": "/output/videos/vid_abc123.mp4",
  "size_bytes": 12345678,
  "thumbnails": [
    {
      "path": "/output/thumbnails/vid_abc123_001.png",
      "width": 320,
      "height": 180
    }
  ]
}
```

#### Formes rejetees :
1. **Duree negative** :
   ```json
   { "duration": -10 }
   ```
    Rejete avec erreur : `"duration must be >= 0"`.

2. **Resolution invalide** :
   ```json
   { "resolution": "1920x" }
   ```
    Rejete avec erreur : `"resolution must match pattern 'WxH'"`.

3. **FPS manquant** :
   ```json
   { "fps": null }
   ```
    Rejete avec erreur : `"fps is required"`.

---

### 3.2. Action : `webgl_integration`

#### Forme acceptee :
```json
{
  "scene_id": "string",
  "webgl_version": "string (ex: '3.0')",
  "shaders": [
    {
      "name": "string",
      "path": "string",
      "type": "vertex|fragment"
    }
  ],
  "textures": [
    {
      "name": "string",
      "path": "string",
      "format": "string (ex: 'RGBA8')"
    }
  ],
  "render_stats": {
    "draw_calls": "number",
    "triangles": "number",
    "gpu_memory_mb": "number"
  }
}
```

#### Exemple valide :
```json
{
  "scene_id": "scene_001",
  "webgl_version": "3.0",
  "shaders": [
    {
      "name": "vertex_shader",
      "path": "/shaders/vertex.glsl",
      "type": "vertex"
    }
  ],
  "textures": [
    {
      "name": "diffuse",
      "path": "/textures/diffuse.png",
      "format": "RGBA8"
    }
  ],
  "render_stats": {
    "draw_calls": 42,
    "triangles": 12345,
    "gpu_memory_mb": 256
  }
}
```

#### Formes rejetees :
1. **Version WebGL invalide** :
   ```json
   { "webgl_version": "2.0" }
   ```
    Rejete avec erreur : `"webgl_version must be >= 3.0"`.

2. **Type de shader manquant** :
   ```json
   { "shaders": [{ "name": "test" }] }
   ```
    Rejete avec erreur : `"shader.type is required"`.

---

## 4. Regles de validation generales

### 4.1. Parsing JSON

- **Toute sortie doit etre un JSON valide** (pas de commentaires, pas de virgules finales).
- **Les cles doivent etre en camelCase** (ex : `videoId` au lieu de `video_id`).
- **Les chaines de caracteres doivent etre encodees en UTF-8**.

#### Exemple invalide :
```json
{
  "video_id": "vid_123", // commentaire invalide
  "duration": 120,
}
```
 Rejete avec erreur : `"Invalid JSON: unexpected token"`.

### 4.2. Validation de schema

Utilisez le schema JSON suivant pour valider les sorties :

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "properties": {
    "status": { "enum": ["success", "error", "warning"] },
    "data": { "type": "object" },
    "metadata": {
      "type": "object",
      "properties": {
        "timestamp": { "type": "string", "format": "date-time" },
        "action": { "type": "string" },
        "version": { "type": "string" }
      },
      "required": ["timestamp", "action", "version"]
    },
    "errors": { "type": "array", "items": { "type": "string" } }
  },
  "required": ["status", "metadata"]
}
```

### 4.3. Validation logique

- **Si `status` est `error`**, le champ `data` doit etre `null` et `errors` doit contenir au moins une erreur.
- **Si `status` est `success`**, le champ `data` doit etre un objet non vide et `errors` doit etre un tableau vide.
- **Les chemins de fichiers (`file_path`, `path`)** doivent etre absolus ou relatifs au repertoire racine du projet.

---

## 5. Erreurs courantes et resolution

| Erreur | Cause | Solution |
|--------|-------|----------|
| `"duration must be >= 0"` | Valeur negative pour `duration`. | Verifiez que la duree calculee est positive. |
| `"resolution must match pattern 'WxH'"` | Format de resolution incorrect. | Utilisez le format `"1920x1080"`. |
| `"Invalid JSON: unexpected token"` | JSON mal forme (commentaire, virgule finale). | Supprimez les commentaires et les virgules finales. |
| `"shader.type is required"` | Champ `type` manquant dans un objet shader. | Ajoutez `"type": "vertex"` ou `"fragment"`. |
| `"webgl_version must be >= 3.0"` | Version WebGL non supportee. | Mettez a jour vers WebGL 3.0 ou superieur. |

---

## 6. Exemples complets

### 6.1. Sortie reussie pour `generate_video`
```json
{
  "status": "success",
  "data": {
    "video_id": "vid_abc123",
    "duration": 120.5,
    "resolution": "1920x1080",
    "fps": 30,
    "codec": "h264",
    "file_path": "/output/videos/vid_abc123.mp4",
    "size_bytes": 12345678,
    "thumbnails": [
      {
        "path": "/output/thumbnails/vid_abc123_001.png",
        "width": 320,
        "height": 180
      }
    ]
  },
  "metadata": {
    "timestamp": "2026-06-03T17:45:26.123Z",
    "action": "generate_video",
    "version": "1.0.0"
  },
  "errors": []
}
```

### 6.2. Sortie en erreur pour `webgl_integration`
```json
{
  "status": "error",
  "data": null,
  "metadata": {
    "timestamp": "2026-06-03T17:46:00.000Z",
    "action": "webgl_integration",
    "version": "1.0.0"
  },
  "errors": [
    "webgl_version must be >= 3.0",
    "shader.type is required for shader 'test'"
  ]
}
```

---

## 7. Outils de validation

Pour valider une sortie JSON contre ces contrats, utilisez :

### 7.1. En ligne de commande (Linux/macOS/WSL)
```bash
# Valider un fichier JSON contre un schema (exemple avec ajv)
npm install -g ajv-cli
ajv validate -s docs/schemas/mistral_contracts.json -d sortie.json
```

### 7.2. En PowerShell (Windows)
```powershell
# Valider un fichier JSON avec ConvertFrom-Json (basique)
$json = Get-Content -Path sortie.json | ConvertFrom-Json
if ($json.status -notin @("success", "error", "warning")) {
    Write-Error "Invalid status: $($json.status)"
}
```

### 7.3. Dans les workflows ComfyUI
Ajoutez une etape de validation dans vos workflows pour rejeter les sorties non conformes.

---

## 8. Annexes

### 8.1. Schema JSON complet
Voir le fichier [`docs/schemas/mistral_contracts.json`](schemas/mistral_contracts.json) (a creer si necessaire).

### 8.2. Historique des versions
- **v1.0.0** (2026-06-03) : Version initiale.

---

## 9. Contact et support

Pour toute question sur ces contrats, ouvrez une **issue** avec le template [`workflow_request.yml`](/.github/ISSUE_TEMPLATE/workflow_request.yml) ou [`bug_report.yml`](/.github/ISSUE_TEMPLATE/bug_report.yml).

---

*Document genere par Mistral pour le projet AI_VIDEO_WEBGL_COMPETENCES.*
```
