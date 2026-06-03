---
name: video-start-end
description: Generate or plan local AI video clips from a start image and an end image, especially with Wan 2.2 FLF2V or LTX, including keyframe planning, four preset quality modes, storyboard timing estimates, and QA for blur, particles, prompt adherence, and transition quality.
---

# Video Start/End

Use this skill when the user wants a video generated from an image of start and image of end, wants to turn a storyboard into connected clips, or wants to diagnose whether the prompt or the keyframes control the transition.

## Core Rule

Treat image-to-video as a controlled production workflow, not a one-shot prompt.

Always do this order:
1. Identify storyboard sections and transitions.
2. Estimate required keyframes and micro-clips.
3. Present the preset table and total generation estimate.
4. Generate or normalize keyframes only after the plan is accepted.
5. Generate clips one-by-one, starting with a pilot micro-clip.
6. QA with frame contact sheets before generating the full storyboard.

## Presets

Times are local estimates for RTX 4070 / Wan 2.2 FLF2V at `1024x576`. FPS changes playback duration, not generation cost.

| Preset | Use | Frames | FPS | Steps | CFG | Shift | Duration per micro-clip | Generation estimate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| 1. Test rapide transitions | Check composition and motion direction only | 33 | 12 | 10 | 5 | 8 | 2.75s | ~5-6 min |
| 2. Qualite mobile | Good enough mobile preview | 33 | 12 | 14 | 5 | 8 | 2.75s | ~6-7 min |
| 3. Qualite desktop | Smoother desktop candidate | 49 | 24 | 16 | 5 | 8 | 2.04s | ~10-13 min |
| 4. Optimum court valide | User-requested best short diagnostic | 33 | 24 | 14 | 5 | 8 | 1.375s | ~6-7 min |

If the user asks where blur starts to disappear, use `14 steps` as the first acceptable threshold and `16 steps` as the best compromise. Use `18-20 steps` only for premium critical clips or final validation.

## Keyframe Count Heuristic

Estimate keyframes from scenario complexity:

| Transition complexity | Examples | Keyframes | Micro-clips |
|---|---|---:|---:|
| Simple | camera push, activation, color/intensity change | 2 | 1 |
| Medium | object opens, organizes, locks, turns into one related form | 3 | 2 |
| Complex morph | cube to face, eye entry to brain, UI to architecture | 4-6 | 3-5 |
| Very complex scene | multiple mechanisms plus camera travel | split into several sections | avoid one giant morph |

Rule of thumb: if start and end images are visually far apart, add a mid-keyframe. Wan/LTX otherwise tends to use blur, dust, smoke, particles, or soft dissolve.

## Prompt Rules

Prefer physical mechanisms over abstract transformation:
- Use: `large rigid panels`, `hard-edged chunks`, `mechanical plates`, `thin precise amber seams`, `solid graphite fragments`.
- Avoid: `particles`, `dust`, `cloud`, `smoke`, `fog`, `haze`, `energy mist`, `liquid morph`, unless the user explicitly wants them.
- Put unwanted shortcuts in negative prompt: `blur transition, soft dissolve, crossfade, smeared motion, blurry particles, orange fog, dust cloud`.

If prompt adherence is questioned, inspect the generated workflow JSON and verify `CLIPTextEncode` contains the full prompt. Do not assume.

## Local Commands

Check ComfyUI:
```powershell
Invoke-WebRequest "http://127.0.0.1:8188/system_stats" -UseBasicParsing
```

Start ComfyUI if needed:
```powershell
npm run comfyui:start
```

Run Wan FLF2V:
```powershell
node D:\00_Cerveau_IA\Conpetances\generate-video-local-wan22-flf2v.mjs `
  --start-image <start.png> `
  --end-image <end.png> `
  --output <clip.mp4> `
  --workflow-json <workflow.json> `
  --prompt "<positive prompt>" `
  --negative "<negative prompt>" `
  --width 1024 --height 576 `
  --frames <33|49> --fps <12|24> `
  --steps <10|14|16|20> --cfg 5 --shift 8 `
  --seed <seed> --no-lora
```

## QA Required

For every pilot clip:
- Verify `ffprobe`: dimensions, frames, duration.
- Extract frames with FFmpeg.
- Build a contact sheet at frames start/middle/end.
- Check: no hard black slab, no fake text/HUD, no unwanted particles, no excessive blur, start/end recognizable.
- If poor: adjust keyframes before increasing steps.

## Delivery

Report:
- preset used;
- micro-clip count;
- estimated and actual generation time;
- output MP4 path;
- contact sheet path;
- recommendation: keep, regenerate with better keyframes, or increase steps.
