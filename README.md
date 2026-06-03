# AI Video WebGL Competences

Depot simple et reutilisable pour creer des videos IA avec image de debut + image de fin, puis les integrer dans un site WebGL/scroll video avec animation cadree a droite.

Ce depot n'est pas une archive brute de tous les tests. Il garde seulement les exemples concrets, les conclusions, les workflows utiles et les competences installables.

## Ce Que Contient Le Depot

- `codex-skills/` : deux skills installables dans Codex.
- `cerveau-competence/` : competence partagee pour le cerveau central `D:\00_Cerveau_IA` et les autres IA.
- `examples/videos/` : quelques videos temoins legeres.
- `examples/contact-sheets/` : comparaisons visuelles et preuves QA.
- `examples/workflows/` : workflows JSON ComfyUI/Wan2.2 utiles pour reproduire les tests.
- `docs/` : rapports courts et conclusions techniques.
- `scripts/` : scripts d'installation des skills, de la competence et des modeles Wan2.2.

## Installation Rapide

```powershell
git clone <URL_DU_REPO>
cd AI_VIDEO_WEBGL_COMPETENCES

# Installer les skills Codex
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skills.ps1

# Installer la competence Cerveau
powershell -ExecutionPolicy Bypass -File scripts/install-cerveau-competence.ps1 -CerveauRoot D:\00_Cerveau_IA

# Installer le profil modele conseille pour commencer: Wan2.2 TI2V 5B
powershell -ExecutionPolicy Bypass -File scripts/install-wan22-models.ps1 -ComfyUIRoot "D:\ComfyUI\ComfyUI" -Profile ti2v5b
```

Adapte `-ComfyUIRoot` au dossier qui contient `models/`, par exemple:

```powershell
D:\00_Cerveau_IA\Conpetances\Video\ComfyUI\ComfyUI_windows_portable\ComfyUI
```

## Les Deux Skills Codex

### `video-start-end`

Pour generer une video a partir d'une image de debut et d'une image de fin.

Utilisation typique:

```text
Utilise la competence video-start-end pour transformer cette image start vers cette image end. Propose les 4 presets puis estime le temps.
```

### `webgl-right-video`

Pour creer une video 16:9 pensee pour un site WebGL: animation sur la droite, gauche reservee au texte/UI/WebGL.

Utilisation typique:

```text
Utilise webgl-right-video pour creer une sequence 16:9: fond sombre continu, animation dans les deux tiers droits, pas de masque noir dur.
```

## Competence Cerveau

La competence partagee se trouve dans:

```text
cerveau-competence/competence-video-start-end-webgl/
```

Une fois installee dans `D:\00_Cerveau_IA\Conpetances\Video`, elle expose un estimateur:

```powershell
cd D:\00_Cerveau_IA\Conpetances
npm run competence:video:estimate -- --sections 10 --complexity complex --preset desktop
```

## Presets Retenus

| # | Preset | Usage | Reglage | Temps estime |
|---|---|---|---|---|
| 1 | `rapid` | Tester les transitions | 33 frames / 12 fps / 10 steps | 5-6 min par microclip |
| 2 | `mobile` | Qualite mobile | 33 frames / 12 fps / 14 steps | 6-7 min |
| 3 | `desktop` | Qualite desktop | 49 frames / 24 fps / 16 steps | 10-13 min |
| 4 | `optimum` | Optimum court valide | 33 frames / 24 fps / 14 steps | 6-7 min |

## Conclusions Des Tests

1. Le prompt seul ne suffit pas pour une transformation complexe.
2. Les meilleurs resultats viennent de microclips avec images start/end et keyframes intermediaires.
3. Le seuil de nettete acceptable commence autour de 14 steps sur nos tests 33 frames.
4. 16 steps est le meilleur compromis desktop.
5. 20 steps ameliore peu la qualite par rapport au temps supplementaire.
6. Il faut eviter les mots comme `particles`, `dust`, `smoke`, `haze`, `liquid morph`, `soft dissolve` si l'on veut une transformation nette.
7. Il faut preferer: plaques graphite rigides, fragments solides, bords nets, fissures ambre, assemblage mecanique.
8. Pour WebGL, ne pas integrer un panneau noir dur dans la video: il peut couper l'animation visuellement.
9. La bonne strategie WebGL est une video 16:9 sombre continue, avec sujet dans les deux tiers droits, et texte/UI/WebGL par-dessus cote gauche.

## Modeles Conseilles

Pour commencer simplement:

- Wan2.2 TI2V 5B: plus leger, text-to-video + image-to-video, bon pour tests et machines modestes.

Pour meilleure coherence image debut/image fin:

- Wan2.2 I2V 14B high/low noise: plus lourd, meilleur pour transitions controlees, demande plus de VRAM/RAM/offload.

Voir `INSTALLATION.md` pour les commandes de telechargement et les sources officielles.

## Exemples Inclus

- `scene-01a-start-only.mp4` : test avec image de depart seule.
- `scene-01b-start-end.mp4` : test avec image de debut + image de fin.
- `c2r-v9-step-sweep-01a-steps10-fps12.mp4` : rapide mais trop flou.
- `c2r-v9-step-sweep-01a-steps14-fps12.mp4` : premier seuil correct.
- `c2r-v9-step-sweep-01a-steps16-fps12.mp4` : meilleur compromis.
- `c2r-v9-quality33-test-01a.mp4` : test plus qualitatif.
- `c2r-v9-clean-composition-test-01a.mp4` : test composition propre.
- `c2r-v9-micro-pilot-01.mp4` : micro-sequence pilote.

## Licence / Note

Ce depot est un kit de travail. Les modeles IA ne sont pas inclus. Il faut les telecharger depuis leurs sources officielles ou compatibles ComfyUI.
