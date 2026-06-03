# Glossaire  Termes cles pour l'IA Video et WebGL

Ce glossaire couvre les termes techniques utilises dans le projet **AI_VIDEO_WEBGL_COMPETENCES**, avec des explications adaptees aux workflows IA, ComfyUI, et integrations WebGL.

---

## A

### AI Video Terms (Termes de l'IA Video)
**Definition** : Ensemble de concepts lies a la generation, au traitement et a la composition de videos assistes par l'IA.

- **Start/End Images** : Images cles utilisees pour definir le debut et la fin d'une sequence video generee. Elles servent de reperes pour les modeles de diffusion (ex: Stable Diffusion, Wan22) ou les transitions.
- **Presets** : Configurations predefinies (ex: `preset_video_1080p.json`) optimisees pour des cas d'usage specifiques (ex: video courte, long-metrage, style artistique). Les presets incluent des parametres comme la resolution, le nombre de frames, ou les modeles IA a utiliser.
- **Contact Sheet** : Document visuel genere automatiquement ou manuellement, combinant plusieurs frames d'une video ou d'un workflow pour faciliter l'analyse qualite (QA) ou le debugging. Exemple : `contact_sheet_001.png` avec 12 frames en grille.

---

## W

### Wan / LTX
**Definition** : Modeles ou frameworks specifiques utilises pour la generation video ou les transitions dans ComfyUI.

- **Wan** : Modele de diffusion video developpe par Stability AI, optimise pour la generation de sequences longues ou stylisees. Souvent utilise avec des prompts detailles pour controler le style et le mouvement.
- **LTX** : Framework ou modele alternatif (ex: LTX Video) pour la generation video, parfois prefere pour sa rapidite ou sa compatibilite avec certains workflows ComfyUI. Peut necessiter des ajustements de prompts ou de parametres.

**Exemple d'usage** :
```json
{
  "model": "wan_video_v1",
  "preset": "preset_ltx_720p",
  "start_image": "start_frame_001.png",
  "end_image": "end_frame_090.png"
}
```

---

## C

### Contact Sheet (Feuille de Contact)
**Definition** : Outil visuel pour evaluer la qualite d'une video generee ou d'un workflow. Une contact sheet est une image composite affichant plusieurs frames extraites d'une sequence, souvent annotees avec des metadonnees (ex: numero de frame, modele utilise, score de qualite).

**Cas d'usage** :
- **QA (Quality Assurance)** : Identifier des artefacts, des incoherences de mouvement, ou des problemes de prompt.
- **Debugging** : Comparer des versions de workflows ou des parametres.
- **Documentation** : Illustrer des exemples de sortie pour des tutoriels ou des rapports.

**Outils pour generer une contact sheet** :
- Scripts Python (ex: `scripts/generate_contact_sheet.py`).
- Outils integres a ComfyUI (ex: nuds `ContactSheet` ou `FrameCompare`).
- Logiciels externes (ex: FFmpeg pour extraire des frames + montage manuel).

**Exemple de structure** :
```
contact_sheet_001/
 frames/
    frame_001.png
    frame_045.png
    frame_090.png
 metadata.json
 contact_sheet.png
```

---

## W

### WebGL (Integration WebGL)
**Definition** : Technologie de rendu graphique basee sur le navigateur, utilisee pour afficher des videos generees par IA ou des compositions en temps reel dans une interface web. Dans ce projet, WebGL est souvent utilise pour :

- **Right-Side Composition** : Afficher une video generee (ex: via Wan/LTX) a droite d'une interface utilisateur, avec des controles interactifs (ex: timeline, parametres de style) a gauche.
- **Previsualisation** : Rendre des frames ou des sequences en temps reel pour ajuster les parametres avant export.
- **Export** : Generer des videos ou des GIFs a partir de la composition WebGL.

**Exemple d'architecture** :
```
Interface Web (HTML/JS)
 Left Panel : Controles (presets, prompts, timeline)
 Right Panel : WebGL Canvas (affichage video + composition)
```

**Outils/Frameworks** :
- **Three.js** : Bibliotheque JavaScript pour le rendu 3D et video.
- **Babylon.js** : Alternative a Three.js, parfois utilisee pour des effets avances.
- **Custom Shaders** : Pour des effets visuels specifiques (ex: distorsion, transitions).

**Bonnes pratiques** :
- Utiliser des textures compressees (ex: `.jpg` ou `.webp`) pour reduire la latence.
- Limiter le nombre de calques (layers) pour eviter les freezes.
- Tester sur differents navigateurs (Chrome, Firefox, Safari) et appareils (mobile/desktop).

---

## P

### Presets (Prereglages)
**Definition** : Fichiers de configuration (JSON/YAML) contenant des parametres optimises pour des cas d'usage specifiques. Les presets simplifient le processus de generation video en evitant de reconfigurer manuellement chaque parametre.

**Exemples de presets** :
- `preset_video_4k.json` : Pour des videos ultra-haute definition (resolution 3840x2160).
- `preset_transition_smooth.json` : Pour des transitions fluides entre deux images/clips.
- `preset_style_anime.json` : Pour un style artistique inspire de l'anime.

**Structure typique d'un preset** :
```json
{
  "model": "wan_video_v1",
  "resolution": [1920, 1080],
  "frames": 60,
  "fps": 30,
  "prompt": "A futuristic city at night, cyberpunk style, neon lights, cinematic",
  "negative_prompt": "blurry, low quality, deformed",
  "seed": 42,
  "guidance_scale": 7.5,
  "steps": 30,
  "output_format": "mp4"
}
```

**Ou les trouver ?** :
- Dossier `presets/` dans le projet.
- Integres a ComfyUI (ex: `ComfyUI/custom_nodes/presets/`).

---

## D

### Decision Guide (Guide de Decision)
**Definition** : Processus structure pour choisir la prochaine action en fonction du contexte (ex: type de video, contraintes techniques, objectifs). Ce guide est concu pour eviter les blocages et optimiser le workflow.

**Etapes cles** :
1. **Definir l'objectif** : Quel est le resultat souhaite ? (ex: video stylisee, transition entre deux scenes, debug d'un artefact).
2. **Evaluer les contraintes** : Resolution, temps de rendu, materiel disponible (GPU/CPU), compatibilite des modeles.
3. **Choisir la technologie** :
   - **Wan/LTX** : Pour des videos longues ou stylisees.
   - **WebGL** : Pour une previsualisation interactive ou une integration web.
   - **Contact Sheet** : Pour le QA ou le debugging.
4. **Selectionner un preset** : Utiliser un preset existant ou en creer un nouveau.
5. **Executer et iterer** : Generer un prototype, analyser les resultats, ajuster les parametres.

**Exemple de flowchart** :
```
Objectif: Generer une video de 30 secondes en style anime
 Contrainte: GPU limite (RTX 3060)
    Modele: Wan (optimise pour les GPU mid-range)
    Preset: `preset_style_anime_720p.json`
 Contrainte: Previsualisation web
     Technologie: WebGL + Three.js
```

---

## R

### Right-Side Composition (Composition Cote Droit)
**Definition** : Technique de mise en page ou le contenu principal (ex: video generee) est affiche a droite de l'interface, tandis que les controles ou metadonnees sont places a gauche. Cette approche est courante dans les outils de montage video ou les interfaces de generation IA.

**Avantages** :
- **Clarte** : Separation visuelle entre le contenu et les parametres.
- **Ergonomie** : Acces rapide aux controles tout en visualisant le resultat.
- **Extensibilite** : Possibilite d'ajouter des panneaux supplementaires (ex: timeline, historique).

**Exemple d'implementation** :
```html
<div class="interface">
  <div class="left-panel">
    <!-- Controles (presets, prompts, timeline) -->
  </div>
  <div class="right-panel">
    <!-- WebGL Canvas pour afficher la video -->
    <canvas id="webgl-canvas"></canvas>
  </div>
</div>
```

**CSS typique** :
```css
.interface {
  display: flex;
  height: 100vh;
}
.left-panel {
  width: 30%;
  padding: 1rem;
  background: #f5f5f5;
}
.right-panel {
  width: 70%;
  background: #000;
}
```

---

## T

### Transition (Transitions entre images/clips)
**Definition** : Effet visuel utilise pour passer d'une image ou d'un clip a un autre de maniere fluide. Dans le contexte IA, les transitions peuvent etre :

- **Generees par IA** : Utilisation de modeles comme Wan22 pour creer des sequences de transition entre deux images.
- **Effets manuels** : Utilisation de logiciels de montage (ex: Adobe Premiere, Blender) pour ajouter des transitions (fondu, glissement, etc.).
- **Parametriques** : Ajustement de parametres dans ComfyUI (ex: `transition_strength`, `motion_blur`).

**Exemple de prompt pour une transition Wan22** :
```
"A smooth transition from a forest to a futuristic city, cinematic, 4K, hyperrealistic"
```

**Outils pour generer des transitions** :
- Nuds ComfyUI : `Wan22 Transition`, `Frame Interpolation`.
- Scripts Python : `scripts/generate_transition.py`.

---

### Notes
- Les termes marques d'un **"*"** sont specifiques au projet **AI_VIDEO_WEBGL_COMPETENCES**.
- Pour des definitions plus techniques, consulter les fichiers comme `docs/WAN_LTX_TERMS.md` ou `docs/CONTACT_SHEET_QA.md`.

---
*Derniere mise a jour : Juin 2026*
*Source : Projet AI_VIDEO_WEBGL_COMPETENCES*
