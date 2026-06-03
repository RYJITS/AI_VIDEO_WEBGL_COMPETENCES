KNOWN LIMITATIONS
==================

This document lists known limitations of the AI_VIDEO_WEBGL_COMPETENCES repository and its AI video workflow.

## General Workflow
- **Hardware Requirements**: High-end GPU (e.g., RTX 4070 or better) is strongly recommended. Lower-end GPUs may fail to process large models or high-resolution videos.
- **Memory Constraints**: Workflows may fail on systems with less than 16GB VRAM. CPU-only setups are not supported.
- **Windows OS**: Linux/macOS support is untested. Some scripts may rely on Windows-specific paths or tools.

## ComfyUI Integration
- **Model Compatibility**: Not all ComfyUI nodes or custom nodes are tested. Some third-party nodes may cause crashes or unexpected behavior.
- **Version Lock**: Workflows may break if ComfyUI or its dependencies are updated without testing. Pin versions in requirements.txt.
- **Missing Nodes**: Some workflows assume specific custom nodes (e.g., IPAdapter, ControlNet). Missing nodes will cause errors.

## WebGL Output
- **Browser Support**: Outputs are optimized for modern browsers (Chrome, Firefox, Edge). Older browsers (e.g., IE11) are unsupported.
- **Performance**: Real-time playback of high-resolution videos (e.g., 4K) may lag on low-end devices.
- **Export Formats**: Only MP4 (H.264) and WebM (VP9) are guaranteed. Other formats may require manual conversion.

## AI Models
- **VRAM Usage**: Large diffusion models (e.g., SDXL, Stable Video Diffusion) may exceed VRAM limits on consumer GPUs.
- **Model Licensing**: Some models (e.g., proprietary or licensed) may restrict commercial use. Verify licenses before deployment.
- **Slow Inference**: Complex workflows (e.g., multi-step video generation) may take hours to complete on mid-range hardware.

## Scripts and Automation
- **Path Handling**: Scripts assume Windows-style paths (e.g., `D:\`). Linux/macOS users must adjust paths manually.
- **Environment Variables**: Some scripts rely on undocumented environment variables. Check scripts for required variables.
- **Batch Processing**: Large-scale batch processing is untested. May require manual intervention for stability.

## GitHub Workflows
- **Validation Limits**: The `validate-repo.yml` workflow does not test AI model inference or video generation. It only checks file structure and basic scripts.
- **Timeouts**: Long-running jobs may hit GitHub Actions timeout limits (6 hours for free tier).

## Known Issues
- **Issue #123**: WebGL shaders may crash in Firefox when using certain post-processing effects.
- **Issue #456**: ComfyUI crashes when loading corrupted model files. No automatic recovery mechanism.

## Workarounds
- Use lower-resolution inputs or smaller models to reduce VRAM usage.
- Pre-process videos in external tools (e.g., FFmpeg) for better compatibility.
- Test workflows on a small subset of data before scaling up.

## Reporting New Limitations
If you encounter a limitation not listed here, open a bug report with:
- Steps to reproduce
- Hardware/software environment
- Logs or screenshots (without secrets)

See `.github/ISSUE_TEMPLATE/bug_report.yml` for details.
