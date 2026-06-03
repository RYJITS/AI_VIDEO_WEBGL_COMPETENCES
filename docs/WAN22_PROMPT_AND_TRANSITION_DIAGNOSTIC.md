# Diagnostic Wan2.2 - Prompt, transitions et cadence scroll

## Verdict court

Le prompt est bien connecte au workflow local: il est encode par `CLIPTextEncode`, puis transmis a `WanFirstLastFrameToVideo` en positif/negatif. Le probleme observe ne vient donc pas d'un prompt ignore.

Le probleme principal est structurel: avec seulement une image de debut et une image de fin, Wan2.2 FLF2V tend a produire une interpolation stable entre les deux images. Pour des actions complexes comme decomposition du cube, reconstruction en tete, zoom dans l'oeil, traversee des fibres neuronales, il faut decomposer la scene en micro-transitions avec des keyframes intermediaires, ou utiliser des controles video/motion.

## Sources consultees

- ComfyUI - `WanFirstLastFrameToVideo`: https://docs.comfy.org/built-in-nodes/WanFirstLastFrameToVideo
- ComfyUI - workflow officiel Wan2.2: https://docs.comfy.org/tutorials/video/wan/wan2_2
- Wan-AI - Wan2.2 I2V-A14B model card: https://huggingface.co/Wan-AI/Wan2.2-I2V-A14B

## Ce que disent les sources

- `WanFirstLastFrameToVideo` est un noeud de conditioning avec `positive`, `negative`, `vae`, dimensions, longueur, `start_image` et `end_image`.
- Wan2.2 I2V-A14B est un modele image-to-video qui supporte 480P et 720P, concu pour une synthese plus stable et moins de mouvements camera irreels.
- Wan2.2 a une architecture MoE avec expert high-noise puis low-noise; dans notre script local, on retrouve cette logique avec deux modeles high/low.
- Le modele peut generer a partir de l'image seule; cela confirme que l'image de depart/fin peut dominer fortement si le prompt n'est pas renforce par des etapes visuelles.

## Test local prompt-adherence

Parametres communs:
- Start: `section-00-end.png`
- End: `section-01-end.png`
- Resolution: `512x288`
- Frames: `33`
- FPS: `12`
- Steps: `8`
- Seed: `250101`
- LoRA: desactivee pour tester le modele sans acceleration LightX2V

Variantes rendues:
- `cube-head-explode-cfg1.mp4`: decomposition en fragments graphite/ambre, CFG 1
- `cube-head-liquid-cfg1.mp4`: fonte liquide metal noir, CFG 1
- `cube-head-explode-cfg3.mp4`: decomposition en fragments, CFG 3

Contact sheet:
`docs/wan22-prompt-adherence-contact-sheet.jpg`

## Interpretation visuelle

- Le prompt modifie bien la nature de la transition: la variante liquide ne ressemble pas a la variante explosion.
- CFG 3 rend l'explosion beaucoup plus visible que CFG 1.
- Malgre cela, Wan reste fortement attire par l'image de fin: il tend a faire apparaitre la tete assez vite plutot qu'a executer toute la choregraphie detaillee.

## Cause probable des coupures vues a partir du cerveau

Les videos source contiennent deja des sujets trop grands/proches du bord entre la zone noire gauche et la scene droite. Le site ne coupe pas la video arbitrairement: il affiche les frames source. La correction definitive est de regenerer les keyframes/videos des scenes cerveau/dome avec sujet plus petit, plus a droite, et marge de securite.

## Correction deja appliquee au site

- Ajout d'un hold/pause par scene: `videoSeconds: 2.75`, `holdSeconds: 2` dans `src/data/story.js`.
- Mapping scroll adapte dans `src/components/App.jsx`: la video avance d'abord, puis la derniere frame reste affichee pendant l'equivalent de 2 secondes avant la scene suivante.
- Leger scale down visuel `.scrub-video { scale(0.94) }` pour reduire les coupures visibles en attendant une regeneration propre.

## Strategie V9 recommandee

Ne plus faire une grosse transition en 1 clip. Faire des micro-clips:

### Scene 01 - cube vers tete

1. Cube active -> cube fissure et plaques qui se detachent.
2. Fragments graphite/ambre -> nuage organise de fragments.
3. Nuage -> volume de crane/tete approximatif.
4. Tete approximative -> visage humain complet avec cerveau fibres optiques.

### Scene 02 - visage vers cerveau

1. Visage complet -> camera se rapproche de l'oeil.
2. Oeil plein cadre -> entree par la pupille.
3. Tunnel optique/fibres -> reseau neuronal interne.
4. Reseau neuronal -> architecture neuronale claire.

### Scenes cerveau/dome

- Regenerer les keyframes avec sujet plus petit et plus a droite.
- Garder la moitie gauche noir pur.
- Ajouter marge de securite de 8-12% entre sujet et centre de l'image.

## Parametres recommandes pour prochaines generations

- Tests rapides: `512x288`, `33 frames`, `steps 8`, `cfg 3`, `--no-lora`.
- Pilote qualite: `768x432` ou `1024x576`, `49 frames`, `steps 8`, `cfg 3`, `--no-lora`.
- Production: seulement apres validation pilote, monter en frames/resolution.
- LoRA LightX2V: utile pour vitesse, mais a eviter sur les transitions ou on veut une dynamique riche et specifique.

## Decision

Wan2.2 est capable de faire des transitions differentes, mais pas de garantir une choregraphie complexe avec seulement debut/fin. Le prochain pas robuste est une V9 avec keyframes intermediaires et micro-clips, puis integration site avec la pause deja en place.
