---
name: webgl-right-video
description: Build or plan WebGL/scroll video experiences where 16:9 AI video is composed with animation on the right and text/UI on the left, avoiding hard black panels inside the video, with keyframe generation, four quality presets, timing estimates, and integration QA for scroll-controlled websites.
---

# WebGL Right Video

Use this skill when the user wants a WebGL/scrollytelling site with AI video in 16:9, text on the left, and animation on the right.

## Core Composition Rule

Do not generate a hard left-half black panel inside the video.

Preferred composition:
```text
site/css/webgl = black atmosphere + text area
video = continuous 16:9 cinematic black background, subject placed in right two thirds
```

Avoid:
```text
[ pure black vertical panel ][ animation squeezed right ]
```

Why: Wan/LTX treats the black panel as a visual object or mask. It can look like a black slab passing in front of the animation.

## Presets

Times are local estimates for RTX 4070 / Wan 2.2 FLF2V at `1024x576`. FPS changes playback duration, not generation cost.

| Preset | Use | Frames | FPS | Steps | CFG | Shift | Duration per micro-clip | Generation estimate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| 1. Test rapide transitions | Validate right-side composition and scroll timing | 33 | 12 | 10 | 5 | 8 | 2.75s | ~5-6 min |
| 2. Qualite mobile | Mobile preview, acceptable sharpness | 33 | 12 | 14 | 5 | 8 | 2.75s | ~6-7 min |
| 3. Qualite desktop | Smoother desktop candidate | 49 | 24 | 16 | 5 | 8 | 2.04s | ~10-13 min |
| 4. Optimum court valide | User-requested short optimum | 33 | 24 | 14 | 5 | 8 | 1.375s | ~6-7 min |

Use `14 steps` as the first threshold where blur/particle fog becomes acceptable. Use `16 steps` as the default final compromise for desktop when time allows.

## Storyboard To Keyframes

If the user provides text only, generate keyframes first. If they provide images, normalize them.

Estimate:
- simple transition: 2 keyframes, 1 micro-clip;
- medium mechanical transformation: 3 keyframes, 2 micro-clips;
- complex morph/camera travel: 4-6 keyframes, 3-5 micro-clips;
- full site story: split each chapter into separate micro-clips, never one huge morph.

Before rendering all clips, show:
- storyboard sections;
- keyframe list;
- micro-clip count;
- chosen preset;
- estimated total time.

## Keyframe Layout

Use `1024x576`.

Good framing:
- full background is continuous dark cinematic space;
- subject in right two thirds, usually around `x=650-850`;
- generous empty black space left for text;
- no vertical boundary at center;
- subject not touching the text zone;
- no fake text, HUD, logos, labels.

Bad framing:
- left half pure black with a hard vertical border;
- subject starts exactly at `x=512`;
- thin particles/dust clouds used as the main transition;
- end keyframe contains a large dark slab/face in front.

## Prompt Pattern

Use:
```text
Full 16:9 cinematic realistic scene. Continuous deep black atmosphere across the whole frame, not a vertical black panel. Subject stays in the right two thirds with generous empty space on the left for website text. Transformation uses solid mechanical parts: large graphite panels, hard-edged chunks, precise amber seams, crisp fibers or nodes. No dust, no smoke, no fog, no particles, no soft dissolve, no blur transition, no HUD, no text.
```

Negative:
```text
vertical black wall, foreground black mask, black panel in front, occlusion slab, particles, dust, orange fog, smoke, haze, soft dissolve, blur transition, smeared motion, blurry particles, fake text, HUD, logo
```

## Site Integration

For scroll-controlled sites:
- prefer frame sequences for deterministic scrub;
- preload at least active scene plus neighboring scenes;
- for all later scenes, warm frames progressively in idle time;
- keep WebGL background and text separate from video pixels;
- use CSS gradient/mask if text needs more readability;
- do not rely on the video itself to create the left black area.

If using `<video>` or `<canvas>`:
- avoid `object-fit: cover` if it crops the right-side subject unexpectedly;
- verify desktop and mobile screenshots;
- keep animation visible in the right side after responsive scaling.

## QA Required

For every pilot:
- contact sheet of keyframes;
- contact sheet of rendered frames;
- screenshot in the site at representative scroll positions;
- check left readability, no center black slab, no unwanted particles/fog;
- verify actual frame count and duration with `ffprobe`.

## Decision Rule

If animation still looks like a black slab or particle cloud:
1. Fix the end keyframe first.
2. Remove particle/dust/cloud words.
3. Increase steps to `14` or `16`.
4. Only then increase frames.
