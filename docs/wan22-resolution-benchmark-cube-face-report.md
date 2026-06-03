# WAN 2.2 FLF2V Benchmark - Cube vers visage

Objectif: trouver le meilleur compromis resolution / qualite / performance pour la transition cube active -> visage humain avec cerveau de fibres optiques, en utilisant une image de debut et une image de fin.

## Prompt teste

A cinematic realistic premium transformation on a pure black wide screen. The left half of the frame stays empty, uniform black, and motionless. On the right half, an activated obsidian graphite cube with engraved plates and glowing amber cracks physically deconstructs into dense black metallic fragments, thin amber energy seams, dust and small panels. The fragments move smoothly and deliberately, then rebuild into a complete realistic human face on the right, with a visible brain made of warm amber fiber optic strands inside the head. The graphite and amber material language remains consistent from cube to face. Stable camera, no hard cut, no instant replacement, no text, no logo, no HUD, no cyberpunk city.

## Resultats techniques

| Test | Resolution | Frames | Steps | Temps | Temps/frame | Taille | Luma gauche fin | Luma droite fin |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| 384x224-f17-s2 | 384x224 | 17 | 2 | 96s | 5.65s | 71 KB | 1.25 | 20.21 |
| 512x288-f17-s2 | 512x288 | 17 | 2 | 70.43s | 4.14s | 118 KB | 1.48 | 20.9 |
| 576x320-f17-s2 | 576x320 | 17 | 2 | 75.45s | 4.44s | 135 KB | 0.98 | 21.34 |
| 640x368-f17-s2 | 640x368 | 17 | 2 | 75.42s | 4.44s | 175 KB | 1.11 | 18.93 |
| 512x288-f33-s2 | 512x288 | 33 | 2 | 75.43s | 2.29s | 188 KB | 0.98 | 17.27 |
| 640x368-f33-s2 | 640x368 | 33 | 2 | 80.51s | 2.44s | 320 KB | 0.02 | 15.9 |
| 640x368-f33-s4 | 640x368 | 33 | 4 | 80.41s | 2.44s | 346 KB | 0.63 | 16.99 |

## Evaluation visuelle

- 384x224: rapide mais trop faible pour juger finement les textures et la morphologie du visage. Utilisable seulement pour debug.
- 512x288: bon minimum exploitable; visage lisible, fond gauche reste noir, cout faible.
- 576x320: gain modere, mais pas assez net pour justifier un standard intermediaire.
- 640x368: meilleur rendu des volumes du visage et du cerveau ambre, tout en gardant un temps proche des resolutions inferieures dans ce test.
- 33 frames: meilleur pour le scroll que 17 frames; le cout supplementaire est faible sur ces tests.
- 4 steps a 640x368: meilleur compromis actuel; les formes intermediaires sont plus propres que 2 steps et le temps reste autour de 80 secondes.
- La zone gauche reste bien noire sur les meilleurs tests: luma gauche finale environ 0.6 a 1.0, donc compatible avec la composition pleine largeur du site.

## Recommandation

Compromis recommande pour continuer les tests WAN 2.2 FLF2V: **640x368, 33 frames, 12 fps, 4 steps, CFG 1, sans LoRA**.

Profil rapide de previsualisation: **512x288, 33 frames, 2 steps**.

Profil a eviter pour cette scene: **384x224** pour evaluation qualite, car il masque trop les defauts et ne rend pas assez la texture graphite/ambre.

## Fichiers

- Contact sheet: docs/wan22-resolution-benchmark-cube-face-contact-sheet.jpg
- Resultats JSON: public/generated/videos/wan22-resolution-benchmark-cube-face/benchmark-results.json
- Resume JSON: public/generated/videos/wan22-resolution-benchmark-cube-face/benchmark-summary.json
- Videos: public/generated/videos/wan22-resolution-benchmark-cube-face/cube-face-*.mp4
