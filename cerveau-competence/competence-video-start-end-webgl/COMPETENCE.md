# Competence Video Start/End + WebGL Right Video

Objectif: aider toutes les IA du cerveau central a planifier, estimer, generer et valider des videos IA locales a partir d'images debut/fin, avec option WebGL 16:9 animation a droite.

## Quand utiliser

- L'utilisateur fournit un storyboard texte ou images.
- L'utilisateur veut une video avec image de debut + image de fin.
- L'utilisateur veut un site WebGL/scroll-video avec texte a gauche et animation a droite.
- L'utilisateur veut estimer le temps de generation avant de lancer tous les clips.

## Regle principale

Pour les sites WebGL, ne pas integrer un panneau noir dur dans la video.

Preferer:

```text
site/css/webgl = fond noir, texte, ambiance
video = 16:9 continu, sujet dans les deux tiers droits
```

Eviter:

```text
[moitie gauche noir pur dans la video][animation serree a droite]
```

Le panneau noir dur peut devenir une dalle/occlusion pendant la generation.

## Presets

Les temps sont des estimations locales observees avec Wan 2.2 FLF2V a `1024x576` sur RTX 4070.

| Preset | Usage | Frames | FPS | Steps | CFG | Shift | Duree micro-clip | Temps micro-clip |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| 1. Test rapide transitions | Tester direction et raccords | 33 | 12 | 10 | 5 | 8 | 2.75s | ~5-6 min |
| 2. Qualite mobile | Preview mobile correcte | 33 | 12 | 14 | 5 | 8 | 2.75s | ~6-7 min |
| 3. Qualite desktop | Candidat desktop plus fluide | 49 | 24 | 16 | 5 | 8 | 2.04s | ~10-13 min |
| 4. Optimum court valide | Optimum court demande | 33 | 24 | 14 | 5 | 8 | 1.375s | ~6-7 min |

Seuils appris:

- `10-12 steps`: flou/nuage encore visible.
- `14 steps`: premier seuil exploitable.
- `16 steps`: meilleur compromis qualite/temps.
- `18-20 steps`: gain faible supplementaire, a reserver aux clips critiques.

## Estimation keyframes

| Complexite | Exemple | Keyframes | Micro-clips |
|---|---|---:|---:|
| Simple | activation, camera push, intensite lumineuse | 2 | 1 |
| Moyenne | ouverture, organisation, verrouillage | 3 | 2 |
| Complexe | cube vers visage, entree oeil vers cerveau | 4-6 | 3-5 |
| Tres complexe | plusieurs mecanismes + camera travel | decouper en chapitres | eviter morph unique |

Formule:

```text
micro_clips = keyframes - 1
temps_total = micro_clips * temps_preset
```

## Workflow

1. Lire le storyboard.
2. Segmenter en sections et micro-actions physiques.
3. Proposer le nombre de keyframes par section.
4. Afficher le tableau des 4 presets.
5. Estimer le temps total.
6. Demander validation avant generation complete.
7. Generer d'abord un micro-clip pilote.
8. Produire contact sheet et verifier.
9. Regenerer seulement les sections faibles.

## Prompts

Preferer:

```text
large rigid graphite panels, hard-edged mechanical chunks, precise amber seams, solid fragments, crisp fiber lines
```

Eviter:

```text
particles, dust, orange fog, smoke, cloud, haze, soft dissolve, blur transition, liquid morph
```

Negatif recommande:

```text
particles, particle cloud, dust, orange dust, orange fog, smoke, mist, haze, glowing cloud, soft glow blob, blur transition, soft dissolve, crossfade, smeared motion, blurry particles, defocus, motion blur, liquid morph, vertical black wall, foreground black mask, black panel in front, occlusion slab, intact flat side wall, readable text, fake text, letters, numbers, logo, watermark, HUD, interface, cyberpunk city, low quality
```

## Validation obligatoire

- `ffprobe`: dimensions, fps, frame count, duree.
- Contact sheet keyframes.
- Contact sheet frames rendues.
- Verification: pas de dalle noire devant l'animation.
- Verification: pas de flou/nuage non voulu.
- Verification: pas de texte/HUD/logos.

## Scripts

Voir `scripts/estimate-video-storyboard.mjs`.

Exemples:

```powershell
node D:\00_Cerveau_IA\Conpetances\Video\competence-video-start-end-webgl\scripts\estimate-video-storyboard.mjs --sections 10 --complexity complex --preset desktop
```

```powershell
npm run competence:video:estimate -- --sections 10 --complexity medium --preset mobile
```
