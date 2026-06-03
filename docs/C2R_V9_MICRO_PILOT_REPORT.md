# C2R V9 Micro Pilot - Scenes 01-02

## Objectif

Tester une approche plus fidele au scenario: ne plus demander a Wan2.2 une grande transformation en un seul clip, mais decomposer les passages difficiles en micro-transitions controlees par keyframes intermediaires.

## Scenes rendues

### Scene 01 - cube vers visage

Micro-clips:
- `01a`: cube active -> cube fracture
- `01b`: cube fracture -> tete en reconstruction
- `01c`: tete en reconstruction -> tete complete

Sortie assemblee:
- `public/generated/videos/c2r-v9-micro-pilot/c2r-v9-micro-pilot-01.mp4`
- Frames scroll: `public/generated/frames/c2r-v9-micro-pilot/01/frame-0001.jpg...frame-0099.jpg`

### Scene 02 - visage vers oeil puis cerveau

Micro-clips:
- `02a`: tete complete -> gros plan oeil
- `02b`: oeil -> architecture cerveau

Sortie assemblee:
- `public/generated/videos/c2r-v9-micro-pilot/c2r-v9-micro-pilot-02.mp4`
- Frames scroll: `public/generated/frames/c2r-v9-micro-pilot/02/frame-0001.jpg...frame-0066.jpg`

## Parametres Wan2.2

- Resolution: `1024x576`
- Frames par micro-clip: `33`
- FPS: `12`
- Steps: `8`
- CFG: `3`
- LoRA LightX2V: desactivee
- Negative prompt: anti texte, anti HUD, anti crossfade simple, anti jitter

## Keyframes intermediaires

Dossier:
- `public/generated/images/c2r-v9-micro-keyframes/normalized/`

Fichiers cles:
- `section-01-01-cube-fracture.png`
- `section-01-02-head-reconstruction.png`
- `section-02-01-eye-closeup.png`

QA keyframes:
- `docs/c2r-v9-micro-keyframes-contact-sheet.jpg`
- `docs/C2R_V9_MICRO_KEYFRAMES_QA.json`

## QA technique

- Scene 01: `1024x576`, `99 frames`, `8.25s`
- Scene 02: `1024x576`, `66 frames`, `5.5s`
- Build Vite: OK
- Preview navigateur: OK sur `http://127.0.0.1:4181`

QA visuelle:
- `docs/c2r-v9-micro-pilot-timeline-contact-sheet.jpg`
- `docs/browser-qa-c2r-v9-1024-scene-01.png`
- `docs/browser-qa-c2r-v9-1024-scene-02.png`

## Integration site

`src/data/story.js` pointe maintenant:
- Scene 01 -> V9 micro pilot, 99 frames, `videoSeconds: 8.25`, `holdSeconds: 2`
- Scene 02 -> V9 micro pilot, 66 frames, `videoSeconds: 5.5`, `holdSeconds: 2`

Les autres scenes restent sur V8 pour ne pas degrader le site pendant le test.

## Conclusion

Le test confirme que Wan2.2 prend mieux en compte l'intention de transition quand la transformation est decoupee en sous-etapes visuelles. Le prompt seul avec deux images debut/fin donne surtout une interpolation. Pour generaliser au scenario complet, continuer en V9 avec keyframes intermediaires et micro-clips pour les scenes 03-09.

Limites restantes:
- Artefacts Wan visibles sur zones tres detaillees.
- La transition oeil -> cerveau peut encore etre enrichie avec une keyframe tunnel/fibres avant l'architecture cerveau.
- Les prochaines scenes doivent garder le sujet plus petit et a droite pour eviter les coupures perceptuelles.

## Extension scenes 03-05

Ajout du lot V9 micro-transitions pour les scenes 03, 04, 05.

### Scene 03 - clarification neuronale

Micro-clips:
- `03a`: cerveau issu de la scene 02 -> cerveau chaotique surcharge
- `03b`: cerveau chaotique -> cerveau organise

Sortie assemblee:
- `public/generated/videos/c2r-v9-micro-pilot/c2r-v9-micro-pilot-03.mp4`
- Frames scroll: `public/generated/frames/c2r-v9-micro-pilot/03/frame-0001.jpg...frame-0066.jpg`

### Scene 04 - acceleration des flux

Micro-clips:
- `04a`: cerveau organise -> flux acceleres
- `04b`: flux acceleres -> superhighways neuronales

Sortie assemblee:
- `public/generated/videos/c2r-v9-micro-pilot/c2r-v9-micro-pilot-04.mp4`
- Frames scroll: `public/generated/frames/c2r-v9-micro-pilot/04/frame-0001.jpg...frame-0066.jpg`

### Scene 05 - protection hexagonale

Micro-clips:
- `05a`: superhighways -> bouclier hexagonal en formation
- `05b`: bouclier en formation -> dome protecteur complet

Sortie assemblee:
- `public/generated/videos/c2r-v9-micro-pilot/c2r-v9-micro-pilot-05.mp4`
- Frames scroll: `public/generated/frames/c2r-v9-micro-pilot/05/frame-0001.jpg...frame-0066.jpg`

### QA extension

- Videos `03-05`: `1024x576`, `66 frames`, `5.5s`, `12 fps`
- Build Vite: OK
- Preview navigateur: OK sur `http://127.0.0.1:4181`
- Timeline mise a jour: `docs/c2r-v9-micro-pilot-timeline-contact-sheet.jpg`
- Captures navigateur: `docs/browser-qa-c2r-v9-scene-03.png`, `docs/browser-qa-c2r-v9-scene-04.png`, `docs/browser-qa-c2r-v9-scene-05.png`

### Integration site extension

`src/data/story.js` pointe maintenant aussi:
- Scene 03 -> V9 micro pilot, 66 frames, `videoSeconds: 5.5`, `holdSeconds: 2`
- Scene 04 -> V9 micro pilot, 66 frames, `videoSeconds: 5.5`, `holdSeconds: 2`
- Scene 05 -> V9 micro pilot, 66 frames, `videoSeconds: 5.5`, `holdSeconds: 2`

Limite observee: la scene 05 reste visuellement massive; si on veut une version finale plus premium, refaire la keyframe dome avec sujet plus petit et sans cube central dominant.
