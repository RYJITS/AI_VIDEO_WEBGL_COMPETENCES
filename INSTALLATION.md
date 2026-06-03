# Installation Complete

## 1. Prerequis

Installer:

- Git
- Python 3.10 ou 3.11
- Node.js LTS
- FFmpeg
- ComfyUI recent
- Hugging Face CLI pour telecharger les modeles

Commandes utiles Windows:

```powershell
winget install --id Git.Git -e
winget install --id OpenJS.NodeJS.LTS -e
winget install --id Python.Python.3.11 -e
winget install --id Gyan.FFmpeg -e
python -m pip install -U "huggingface_hub[cli]"
```

## 2. Installer ComfyUI

Option simple:

```powershell
git clone https://github.com/comfyanonymous/ComfyUI.git D:\ComfyUI\ComfyUI
cd D:\ComfyUI\ComfyUI
python -m pip install -r requirements.txt
```

Si tu utilises ComfyUI portable, le dossier racine est celui qui contient:

```text
ComfyUI/
  models/
  custom_nodes/
  main.py
```

## 3. Modeles Wan2.2 Conseilles

### Profil `ti2v5b` pour commencer

Ce profil est le plus simple pour tester:

- `wan2.2_ti2v_5B_fp16.safetensors` vers `ComfyUI/models/diffusion_models/`
- `wan2.2_vae.safetensors` vers `ComfyUI/models/vae/`
- `umt5_xxl_fp8_e4m3fn_scaled.safetensors` vers `ComfyUI/models/text_encoders/`

Commande:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-wan22-models.ps1 -ComfyUIRoot "D:\ComfyUI\ComfyUI" -Profile ti2v5b
```

### Profil `i2v14b` pour meilleure qualite

Plus lourd mais plus adapte aux transitions image-to-video controlees:

- `wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors`
- `wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors`
- `wan_2.1_vae.safetensors`
- `umt5_xxl_fp8_e4m3fn_scaled.safetensors`

Commande:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-wan22-models.ps1 -ComfyUIRoot "D:\ComfyUI\ComfyUI" -Profile i2v14b
```

## 4. Installer Les Skills Codex

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skills.ps1
```

Cela copie:

```text
codex-skills/video-start-end       -> %USERPROFILE%/.codex/skills/video-start-end
codex-skills/webgl-right-video     -> %USERPROFILE%/.codex/skills/webgl-right-video
```

## 5. Installer La Competence Cerveau

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install-cerveau-competence.ps1 -CerveauRoot D:\00_Cerveau_IA
```

Cela copie:

```text
cerveau-competence/competence-video-start-end-webgl
-> D:\00_Cerveau_IA\Conpetances\Video\competence-video-start-end-webgl
```

## 6. Sources Officielles

- ComfyUI Wan2.2 official native workflow docs: https://docs.comfy.org/tutorials/video/wan/wan2_2
- ComfyUI Wan2.2 examples: https://comfyanonymous.github.io/ComfyUI_examples/wan22/
- Wan2.2 official GitHub: https://github.com/Wan-Video/Wan2.2

Les docs officielles indiquent que le modele TI2V 5B utilise `wan2.2_ti2v_5B_fp16.safetensors`, `wan2.2_vae.safetensors` et `umt5_xxl_fp8_e4m3fn_scaled.safetensors`. Elles indiquent aussi que les modeles Wan2.2 doivent etre places dans `ComfyUI/models/diffusion_models/`, le VAE dans `ComfyUI/models/vae/`, et l'encodeur texte dans `ComfyUI/models/text_encoders/`.
