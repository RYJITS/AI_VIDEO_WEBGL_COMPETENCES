# WAN 2.2 FLF2V - Test pixels haute resolution

Objectif: verifier si on peut augmenter la qualite en pixels au-dela du profil recommande 640x368, sur la transition cube active -> visage humain avec image de debut et image de fin.

## Resultats haute resolution

| Test | Resolution | Megapixels/frame | Frames | Steps | Temps | Temps/frame | Taille | Luma gauche fin | Luma droite fin |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 640x368-f33-s4 | 640x368 | 0.236 MP | 33 | 4 | 80.41s | 2.44s | 346 KB | 0.63 | 16.99 |
| 768x432-f33-s4 | 768x432 | 0.332 MP | 33 | 4 | 90.43s | 2.74s | 437 KB | 1 | 17.06 |
| 896x512-f33-s4 | 896x512 | 0.459 MP | 33 | 4 | 105.5s | 3.2s | 550 KB | 0.96 | 17.73 |
| 1024x576-f33-s4 | 1024x576 | 0.59 MP | 33 | 4 | 125.75s | 3.81s | 815 KB | 1 | 17.83 |

## Lecture qualite

- 768x432: gain net par rapport a 640x368, temps encore tres raisonnable. Bon profil de production.
- 896x512: plus de pixels, mais quelques frames intermediaires deviennent plus nerveuses/moins propres. Bon si on veut plus grand sans aller au maximum.
- 1024x576: meilleure frame finale en nettete, texture graphite et fibres ambre. Le milieu de transformation est plus brumeux, mais reste coherent avec une reconstruction. Temps environ 126 secondes, donc acceptable pour scene validee, moins pour iteration rapide.

## Recommandation mise a jour

Profil qualite max local actuel: **1024x576, 33 frames, 12 fps, 4 steps, CFG 1, sans LoRA**.

Profil production / meilleur compromis temps-qualite: **768x432, 33 frames, 12 fps, 4 steps, CFG 1, sans LoRA**.

Profil rapide: **512x288 ou 640x368, 33 frames, 2 a 4 steps**.

Conclusion: oui, on peut augmenter la qualite en pixels. Pour une scene que l'on valide visuellement, 1024x576 est maintenant possible localement. Pour tester beaucoup de variantes, rester en 768x432 est plus malin.

## Fichiers

- Contact sheet haute resolution: docs/wan22-highres-pixel-benchmark-cube-face-contact-sheet.jpg
- Video qualite max: public/generated/videos/wan22-resolution-benchmark-cube-face/cube-face-1024x576-f33-s4.mp4
- Video compromis production: public/generated/videos/wan22-resolution-benchmark-cube-face/cube-face-768x432-f33-s4.mp4
