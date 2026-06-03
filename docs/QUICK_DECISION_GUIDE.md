# Guide de Decision Rapide  IA Video & WebGL

Ce guide vous aide a choisir la **prochaine action** en fonction de votre objectif, de vos contraintes et des outils disponibles dans le projet **AI_VIDEO_WEBGL_COMPETENCES**. Utilisez-le pour eviter les blocages et optimiser votre workflow.

---

##  **Etape 1 : Definir votre objectif**
Repondez a ces questions pour affiner votre choix :

| Question | Options possibles | Action suggeree |
|----------|------------------|-----------------|
| **Quel est le resultat souhaite ?** | - Video generee (style artistique, realiste) <br> - Transition entre deux images/clips <br> - Debugging d'un artefact <br> - Previsualisation interactive <br> - Contact sheet pour QA | Passez a l'etape 2. |
| **Duree de la video ?** | - < 10 secondes <br> - 10s a 1 minute <br> - > 1 minute | Influence le choix du modele (Wan vs LTX). |
| **Style visuel ?** | - Realiste <br> - Anime <br> - Cyberpunk <br> - Abstrait <br> - Autre (precisez) | Determine le preset a utiliser. |
| **Contraintes techniques ?** | - GPU limite (ex: RTX 3060) <br> - Temps de rendu critique <br> - Resolution elevee (4K) <br> - Compatibilite mobile | Affecte le choix de la technologie. |

---

##  **Etape 2 : Choisir la technologie adaptee**

###  **Generation de video (style artistique ou realiste)**
| Critere | Wan | LTX | WebGL |
|---------|-----|-----|-------|
| **Longueur de video** | > 10s (meilleur pour les longues sequences) | < 10s (optimise pour les courts clips) | Non applicable |
| **Style** | Tous styles (realiste, anime, etc.) | Style limite (meilleur pour realiste) | Non applicable |
| **GPU requis** | Haut (RTX 4090 recommande) | Moyen (RTX 3060 suffisant) | Bas (integre) |
| **Temps de rendu** | Lent (30+ min pour 1 min) | Rapide (5-15 min pour 1 min) | Instantane (previsualisation) |
| **Cas d'usage** | Videos longues, cinematiques | Clips courts, transitions | Previsualisation, integration web |

**Quand utiliser Wan ?**
- Vous voulez une video de **plus de 10 secondes** avec un style artistique complexe.
- Votre GPU est puissant (RTX 4080/4090).
- Vous avez besoin de **controle fin** sur le style (via prompts detailles).

**Quand utiliser LTX ?**
- Vous generez un **clip court** (< 10s) pour une transition ou un effet.
- Votre GPU est limite (ex: RTX 3060).
- Vous avez besoin d'un rendu **rapide** pour iterer.

---

###  **Transitions entre images/clips**
| Critere | Wan22 | Effets manuels | Parametriques (ComfyUI) |
|---------|-------|----------------|-------------------------|
| **Qualite** | Elevee (IA generee) | Personnalisable | Moyenne (depend des parametres) |
| **Temps** | 5-15 min | 1-5 min | 2-10 min |
| **Complexite** | Faible (1 clic) | Elevee (montage) | Moyenne (ajustement de parametres) |
| **Cas d'usage** | Transitions fluides entre deux scenes | Effets cinematographiques avances | Ajustement rapide de parametres |

**Quand utiliser Wan22 pour les transitions ?**
- Vous voulez une **transition naturelle** entre deux images sans effort manuel.
- Votre prompt inclut des mots-cles comme `smooth transition`, `cinematic`, ou `hyperrealistic`.

**Quand utiliser des effets manuels ?**
- Vous avez besoin de **controle total** sur l'effet (ex: fondu, glissement, morphing).
- Vous utilisez des outils comme Adobe Premiere ou Blender.

---

###  **Debugging ou QA (Quality Assurance)**
| Critere | Contact Sheet | Logs | Previsualisation WebGL |
|---------|---------------|------|-----------------------|
| **Objectif** | Analyser la qualite visuelle | Identifier les erreurs techniques | Tester l'integration web |
| **Outils** | `scripts/generate_contact_sheet.py` <br> Nuds ComfyUI (`ContactSheet`) | Fichiers `.log` ou console | Interface web avec WebGL |
| **Cas d'usage** | Verifier la coherence des frames <br> Identifier des artefacts | Debugger un workflow ComfyUI | Tester la compatibilite mobile |

**Quand generer une contact sheet ?**
- Vous avez genere une video et souhaitez **verifier la qualite** frame par frame.
- Vous comparez deux versions d'un workflow.
- Vous documentez un exemple pour un rapport.

**Exemple de commande** :
```bash
python scripts/generate_contact_sheet.py --input frames/ --output contact_sheet.png --rows 4 --cols 3
```

---

###  **Previsualisation ou integration web**
| Critere | WebGL (Three.js/Babylon.js) | Video exportee | GIF |
|---------|-----------------------------|----------------|-----|
| **Interactivite** | Oui (controles en temps reel) | Non | Non |
| **Latence** | Faible (si optimise) | Elevee (depend de la resolution) | Moyenne |
| **Cas d'usage** | Interface utilisateur pour ajuster des parametres <br> Demonstration interactive | Export final pour partage | Partage rapide sur les reseaux sociaux |

**Quand utiliser WebGL ?**
- Vous voulez une **interface interactive** pour ajuster des parametres (ex: style, duree) avant export.
- Vous integrez la video dans une **application web** (ex: portfolio, site de portfolio).

**Exemple d'architecture** :
```
Interface Web
 Left Panel : Controles (presets, prompts, timeline)
 Right Panel : WebGL Canvas (affichage video en temps reel)
```

---

##  **Etape 3 : Selectionner un preset**
Les **presets** sont des fichiers de configuration optimises pour des cas d'usage specifiques. Voici comment les choisir :

| Type de preset | Exemple de fichier | Cas d'usage | Parametres cles |
|----------------|--------------------|-------------|----------------|
| **Video 1080p** | `preset_video_1080p.json` | Videos courtes/moyennes | Resolution: 1920x1080, FPS: 30, Modele: Wan |
| **Video 4K** | `preset_video_4k.json` | Videos ultra-haute definition | Resolution: 3840x2160, FPS: 60, Modele: Wan |
| **Transition Wan22** | `preset_transition_wan22.json` | Transitions fluides | Duree: 5s, Style: cinematic, Modele: Wan22 |
| **Style Anime** | `preset_style_anime.json` | Videos inspirees de l'anime | Modele: Wan (style anime), Resolution: 1280x720 |
| **LTX Rapide** | `preset_ltx_720p.json` | Clips courts avec LTX | Modele: LTX, Resolution: 1280x720, Duree: <10s |

**Comment creer un preset personnalise ?**
1. Copiez un preset existant (ex: `preset_video_1080p.json`).
2. Modifiez les parametres selon vos besoins (ex: `resolution`, `prompt`, `steps`).
3. Sauvegardez dans `presets/` avec un nom descriptif (ex: `preset_my_custom_style.json`).

**Exemple de preset personnalise** :
```json
{
  "model": "wan_video_v1",
  "resolution": [1920, 1080],
  "frames": 90,
  "fps": 30,
  "prompt": "A serene lake at sunrise, soft pastel colors, cinematic lighting",
  "negative_prompt": "blurry, low quality, deformed",
  "seed": 12345,
  "guidance_scale": 7.5,
  "steps": 25,
  "output_format": "mp4"
}
```

---

##  **Etape 4 : Executer et iterer**
Une fois votre technologie et preset choisis, suivez ces etapes :

1. **Generez un prototype** :
   - Lancez le workflow ComfyUI avec votre preset.
   - Pour WebGL, utilisez l'interface interactive.
2. **Analysez les resultats** :
   - **Video generee** : Verifiez la coherence des frames, les artefacts, ou les incoherences de mouvement.
   - **Contact sheet** : Comparez les frames pour identifier des problemes.
   - **WebGL** : Testez l'interactivite et la compatibilite.
3. **Ajustez les parametres** :
   - Modifiez le `prompt`, le `seed`, ou les parametres techniques (ex: `guidance_scale`).
   - Pour les transitions, ajustez `transition_strength` ou `motion_blur`.
4. **Iterez** : Repetez jusqu'a obtenir le resultat souhaite.

---

##  **Checklist rapide**
Utilisez cette checklist pour valider votre choix :

- [ ] **Objectif** : Mon objectif est-il clair (video, transition, QA, etc.) ?
- [ ] **Technologie** : Ai-je choisi la bonne technologie (Wan, LTX, WebGL, etc.) ?
- [ ] **Preset** : Ai-je selectionne ou cree un preset adapte ?
- [ ] **Contraintes** : Ai-je verifie les contraintes techniques (GPU, temps, resolution) ?
- [ ] **Outils** : Ai-je les outils necessaires (ComfyUI, scripts, WebGL) ?
- [ ] **Test** : Ai-je genere un prototype et analyse les resultats ?

---

##  **Ressources utiles**
- **Documentation** :
  - [WAN_LTX_TERMS.md](WAN_LTX_TERMS.md) : Details sur Wan et LTX.
  - [CONTACT_SHEET_QA.md](CONTACT_SHEET_QA.md) : Guide pour generer des contact sheets.
  - [SCROLL_VIDEO_INTEGRATION_NOTES.md](SCROLL_VIDEO_INTEGRATION_NOTES.md) : Notes sur l'integration WebGL.
- **Exemples** :
  - Dossier `examples/` pour des workflows prets a l'emploi.
  - Nuds ComfyUI : `Wan22 Video`, `ContactSheet`, `Frame Interpolation`.
- **Scripts** :
  - `scripts/generate_contact_sheet.py`
  - `scripts/validate_workflow.py`

---

##  **Probleme ?**
Si vous etes bloque, consultez :
1. **FAQ** : [docs/FAQ.md](FAQ.md) pour des reponses aux questions courantes.
2. **Troubleshooting** : [docs/TROUBLESHOOTING_QUICK.md](TROUBLESHOOTING_QUICK.md) pour resoudre les problemes techniques.
3. **Issues GitHub** : Ouvrez une [issue](https://github.com/RYJITS/AI_VIDEO_WEBGL_COMPETENCES/issues) avec le template adapte.

---
*Derniere mise a jour : Juin 2026*
*Source : Projet AI_VIDEO_WEBGL_COMPETENCES*
