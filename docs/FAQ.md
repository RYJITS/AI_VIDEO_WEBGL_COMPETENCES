## Foire aux questions (FAQ)

Cette FAQ repond aux questions les plus frequentes concernant l'installation, l'utilisation, la validation et la contribution au projet **AI_VIDEO_WEBGL_COMPETENCES**. Consultez egalement le [README](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES#readme) et les [templates d'issues](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/issues/new/choose) pour des informations supplementaires.

---

### Installation et prerequis

#### 1. Quels sont les prerequis pour installer ce projet ?

- **Systeme d'exploitation** : Windows 10 ou 11 (64 bits recommande).
- **Materiel** :
  - GPU NVIDIA avec au moins 8 Go de VRAM (RTX 2060 ou superieur recommande pour les modeles haute resolution).
  - 16 Go de RAM (32 Go recommande pour les workflows complexes).
  - 50 Go d'espace disque libre (SSD fortement recommande).
- **Logiciels** :
  - [Python 3.10 ou 3.11](https://www.python.org/downloads/) (64 bits).
  - [Git](https://git-scm.com/download/win) pour cloner le depot.
  - [Node.js 18.x ou superieur](https://nodejs.org/) (pour les outils de build WebGL).
  - [ComfyUI](https://github.com/comfyanonymous/ComfyUI) (version compatible avec les workflows fournis).
  - [FFmpeg](https://ffmpeg.org/) (pour le traitement video, ajoutez-le au PATH).
- **Modeles** : Certains workflows utilisent des modeles comme Stable Diffusion XL ou des modeles de video generation. Telechargez-les via ComfyUI ou les liens fournis dans les exemples.

#### 2. Comment installer le projet depuis GitHub ?

1. Clonez le depot :
   ```bash
   git clone https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES.git
   cd AI_VIDEO_WEBGL_COMPETENCES
   ```

2. Installez les dependances Python :
   ```bash
   python -m venv venv
   .\venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. Installez les dependances Node.js (si utilisees) :
   ```bash
   npm install
   ```

4. Configurez ComfyUI :
   - Placez les workflows fournis dans le dossier `ComfyUI/custom_nodes/` ou utilisez les presets fournis.
   - Telechargez les modeles requis via l'interface de ComfyUI ou les scripts d'installation.

5. Testez l'installation :
   ```bash
   python -c "import torch; print(torch.cuda.is_available())"
   ```
   Doit retourner `True` si votre GPU est detecte.

#### 3. Je rencontre des erreurs lors de l'installation de ComfyUI. Que faire ?

- **Erreur de dependances** : Assurez-vous d'utiliser Python 3.10 ou 3.11. Certaines versions de ComfyUI ne sont pas compatibles avec Python 3.12.
- **Probleme de GPU** : Verifiez que vos pilotes NVIDIA sont a jour. Utilisez `nvidia-smi` pour confirmer que le GPU est detecte.
- **Espace disque** : Liberez de l'espace ou utilisez un disque avec suffisamment de place.
- **Consultez** : [COMFYUI_SETUP_CHECKLIST.md](docs/COMFYUI_SETUP_CHECKLIST.md) pour une liste de verification detaillee.

---

### Utilisation et exemples

#### 4. Comment executer un exemple fourni ?

1. Placez-vous dans le dossier de l'exemple souhaite :
   ```bash
   cd examples/video_contact_sheet
   ```

2. Lancez le workflow via ComfyUI :
   - Ouvrez ComfyUI dans votre navigateur.
   - Chargez le fichier `.json` de l'exemple (ex: `contact_sheet_workflow.json`).
   - Cliquez sur `Queue Prompt`.

3. Pour les exemples en ligne de commande :
   ```bash
   python run_example.py --workflow contact_sheet_workflow.json --output output.mp4
   ```

#### 5. Comment modifier un exemple pour l'adapter a mes besoins ?

- **Parametres** : Modifiez les valeurs dans le fichier `.json` du workflow (ex: resolution, duree, modeles).
- **Skills** : Ajoutez ou supprimez des nodes dans ComfyUI pour changer les etapes de traitement.
- **Presets** : Utilisez les presets fournis dans `presets/` pour des configurations predefinies.
- **Documentation** : Consultez [EXAMPLES_INDEX.md](docs/EXAMPLES_INDEX.md) pour une liste des exemples et leurs descriptions.

#### 6. Pourquoi ma video generee a une mauvaise qualite ?

- **Resolution** : Verifiez que la resolution dans le workflow correspond a vos besoins (ex: 1024x576 pour du 16:9).
- **Modeles** : Utilisez des modeles adaptes a la resolution souhaitee (ex: SDXL pour 1024x1024, SD 1.5 pour 512x512).
- **Parametres de generation** : Ajustez les parametres comme `cfg_scale`, `steps`, ou `sampler` dans le workflow.
- **Post-traitement** : Appliquez des filtres de nettete ou de reduction de bruit via FFmpeg ou ComfyUI.
- **Consultez** : [wan22-highres-pixel-benchmark-cube-face-report.md](docs/wan22-highres-pixel-benchmark-cube-face-report.md) pour des conseils sur la qualite video.

---

### Validation et debogage

#### 7. Comment valider que mon installation fonctionne ?

1. **Validation GPU** :
   ```bash
   python -c "import torch; print(torch.cuda.get_device_name(0))"
   ```
   Doit afficher le nom de votre GPU.

2. **Validation ComfyUI** :
   - Chargez un workflow simple (ex: `examples/simple_latent.json`).
   - Exportez une image de test. Si cela fonctionne, ComfyUI est correctement installe.

3. **Validation du projet** :
   ```bash
   python local_validation.py --check gpu
   ```
   (Consultez [LOCAL_VALIDATION.md](docs/LOCAL_VALIDATION.md) pour plus de details.)

#### 8. Mon workflow plante avec une erreur de type `CUDA out of memory`. Que faire ?

- **Reduire la resolution** : Diminuez la resolution dans le workflow (ex: 512x512 au lieu de 1024x1024).
- **Batch size** : Utilisez un batch size de 1 pour les tests.
- **Modeles legers** : Remplacez les modeles par des versions plus legeres (ex: SD 1.5 au lieu de SDXL).
- **VRAM** : Fermez les autres applications gourmandes en GPU ou utilisez un GPU avec plus de VRAM.
- **Optimisation** : Activez l'optimisation de la memoire dans ComfyUI (parametre `force_fp16` si disponible).

#### 9. Comment obtenir des logs detailles pour un debogage ?

1. Activez les logs dans ComfyUI :
   - Modifiez le fichier `config.json` de ComfyUI pour ajouter :
     ```json
     "log_level": "debug"
     ```

2. Exportez les logs :
   ```bash
   python run_workflow.py --workflow mon_workflow.json --log-level debug > logs.txt 2>&1
   ```

3. Partagez les logs dans une issue GitHub (sans secrets) ou consultez [TROUBLESHOOTING_QUICK.md](docs/TROUBLESHOOTING_QUICK.md).

---

### Integration WebGL

#### 10. Comment integrer une video generee dans une page WebGL ?

1. **Preparation de la video** :
   - Exportez votre video au format `.mp4` (H.264 recommande pour la compatibilite).
   - Utilisez FFmpeg pour convertir si necessaire :
     ```bash
     ffmpeg -i input.avi -c:v libx264 -preset slow -crf 18 output.mp4
     ```

2. **Integration dans une page Web** :
   - Utilisez une balise `<video>` HTML5 :
     ```html
     <video id="myVideo" controls width="100%">
       <source src="path/to/output.mp4" type="video/mp4">
     </video>
     ```
   - Pour une integration avancee avec WebGL (ex: shader personnalise) :
     - Chargez la video dans une texture WebGL :
       ```javascript
       const video = document.getElementById('myVideo');
       const texture = gl.createTexture();
       gl.bindTexture(gl.TEXTURE_2D, texture);
       gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, video);
       ```
     - Consultez [SCROLL_VIDEO_INTEGRATION_NOTES.md](docs/SCROLL_VIDEO_INTEGRATION_NOTES.md) pour des exemples complets.

3. **Problemes de performance** :
   - Utilisez des videos en basse resolution pour les previsualisations.
   - Optimisez les shaders WebGL pour reduire la charge GPU.
   - Testez sur plusieurs navigateurs (Chrome, Firefox, Edge).

---

### Contribution

#### 11. Comment contribuer au projet ?

1. **Signaler un bug** : Utilisez le template [Bug report](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/issues/new?template=bug_report.yml).
2. **Proposer une amelioration** : Utilisez le template [Feature request](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/issues/new?template=feature_request.yml).
3. **Soumettre une pull request** :
   - Forkez le depot.
   - Creer une branche pour votre contribution :
     ```bash
     git checkout -b ma-contribution
     ```
   - Appliquez vos changements et poussez la branche :
     ```bash
     git push origin ma-contribution
     ```
   - Ouvrez une pull request depuis GitHub.

4. **Guidelines** :
   - Respectez le style de code existant.
   - Ajoutez des tests si possible (ex: validation des workflows).
   - Documentez vos changements dans le code ou les fichiers de documentation.
   - Consultez [CONTRIBUTING.md](CONTRIBUTING.md) pour plus de details.

#### 12. Quels types de contributions sont les bienvenus ?

- **Documentation** : Correction de fautes, ajouts d'exemples, ou traductions.
- **Skills** : Nouveaux workflows ou nodes pour ComfyUI.
- **Exemples** : Videos ou contact sheets generes avec des techniques innovantes.
- **Optimisations** : Ameliorations des performances ou de la qualite video.
- **Tests** : Validation des workflows sur differentes configurations materielle.

#### 13. Comment tester une pull request avant de la merger ?

1. Clonez la branche de la pull request :
   ```bash
   git fetch origin pull/ID/head:pr-branch
   git checkout pr-branch
   ```

2. Installez les dependances et testez :
   ```bash
   pip install -r requirements.txt
   python local_validation.py --check all
   ```

3. Examinez les changements dans ComfyUI ou les exemples.

4. Si la pull request introduit de nouvelles fonctionnalites, testez-les avec les workflows fournis.

---

### Divers

#### 14. Le projet supporte-t-il d'autres systemes d'exploitation que Windows ?

Le projet est principalement developpe pour Windows, mais certaines parties peuvent fonctionner sur Linux ou macOS. Cependant :
- Les workflows ComfyUI peuvent necessiter des ajustements.
- Les dependances GPU (CUDA) sont optimisees pour NVIDIA sous Windows.
- Pour une experience optimale, utilisez Windows 10/11 avec un GPU NVIDIA.

#### 15. Comment obtenir de l'aide supplementaire ?

- **Issues GitHub** : Ouvrez une issue avec le template [Question](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/issues/new?template=question.yml).
- **Discussions** : Consultez le forum [Discussions](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/discussions) du projet.
- **Documentation** : Parcourez les fichiers dans le dossier `docs/` pour des guides detailles.
- **Communaute** : Rejoignez le serveur Discord ou le groupe Telegram du projet (liens dans le README).

#### 16. Puis-je utiliser ce projet pour un usage commercial ?

Le projet est publie sous licence [LICENSE](LICENSE) (consultez le fichier pour les details). En general :
- Vous pouvez utiliser, modifier et distribuer le code pour un usage commercial.
- Vous devez inclure la licence et les mentions de copyright dans vos distributions.
- Consultez [LICENSING.md](docs/LICENSING.md) pour plus d'informations.

---

Derniere mise a jour : Juin 2026
