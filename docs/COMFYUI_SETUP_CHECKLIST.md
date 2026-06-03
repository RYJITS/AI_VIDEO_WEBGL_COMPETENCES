```markdown
# COMFYUI_SETUP_CHECKLIST

Liste de verification pour configurer ComfyUI dans ce projet.

## 1. Pre-requis
- Windows 10/11 (64 bits)
- GPU NVIDIA avec pilotes a jour (CUDA 12.x recommande)
- Python 3.10 ou 3.11 (64 bits)
- Node.js LTS (pour les scripts frontaux)
- Git (pour cloner le depot)

## 2. Installation de ComfyUI

### Option A: Installation manuelle
1. Cloner le depot:
   ```powershell
   git clone https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES.git
   cd AI_VIDEO_WEBGL_COMPETENCES
   ```
2. Installer les dependances Python:
   ```powershell
   python -m venv venv
   .\venv\Scripts\activate
   pip install -r requirements.txt
   ```
3. Lancer ComfyUI:
   ```powershell
   python main.py --listen
   ```

### Option B: Script d'installation (Windows)
```powershell
.
scripts\install-cerveau-competence.ps1
```

## 3. Configuration de l'environnement

### Variables d'environnement
- `COMFYUI_PORT`: Port pour l'interface (defaut: 8188)
- `PYTORCH_CUDA_ALLOC_CONF`: Optimisation GPU (ex: `garbage_collection_threshold:0.6,max_split_size_mb:128`)

### Fichiers de configuration
- `config/comfyui.json`: Configuration principale
- `config/skills.json`: Liste des skills chargees

## 4. Validation de l'installation

### Test basique
1. Ouvrir `http://localhost:8188` dans un navigateur
2. Verifier que l'interface ComfyUI s'affiche
3. Charger un workflow exemple depuis `examples/`

### Logs attendus
```
[I 2026-06-03 17:20:00] ComfyUI version: 0.10.0
[I 2026-06-03 17:20:00] WebSocket server started at ws://0.0.0.0:8188
[I 2026-06-03 17:20:00] HTTP server started at http://0.0.0.0:8188
```

## 5. Resolution des problemes courants

### Probleme: GPU non detecte
- Solution: Installer les pilotes NVIDIA les plus recents
- Verifier avec `nvidia-smi` dans un terminal

### Probleme: Erreur de module manquant
- Solution: Executer `pip install -r requirements.txt` dans l'environnement virtuel

### Probleme: Port deja utilise
- Solution: Modifier `COMFYUI_PORT` dans les variables d'environnement ou utiliser `--port` dans la commande de lancement

## 6. Documentation complementaire
- [GITHUB_MAINTENANCE.md](../GITHUB_MAINTENANCE.md)
- [LOCAL_VALIDATION.md](../LOCAL_VALIDATION.md)

---
Derniere mise a jour: 2026-06-03
```
