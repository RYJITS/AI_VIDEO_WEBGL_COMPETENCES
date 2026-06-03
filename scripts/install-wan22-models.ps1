param(
  [Parameter(Mandatory=$true)]
  [string]$ComfyUIRoot,

  [ValidateSet("ti2v5b", "i2v14b")]
  [string]$Profile = "ti2v5b"
)

$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$Path) {
  if (!(Test-Path $Path)) { New-Item -ItemType Directory -Force -Path $Path | Out-Null }
}

function Download-HF([string]$Repo, [string]$File, [string]$TargetDir) {
  Ensure-Dir $TargetDir
  $name = Split-Path $File -Leaf
  $target = Join-Path $TargetDir $name
  if (Test-Path $target) {
    Write-Host "Already present: $target"
    return
  }
  Write-Host "Downloading $name"
  huggingface-cli download $Repo $File --local-dir $TargetDir

  $nested = Join-Path $TargetDir $File
  if ((Test-Path $nested) -and !(Test-Path $target)) {
    Move-Item -Force $nested $target
  }
}

$diffusion = Join-Path $ComfyUIRoot "models\diffusion_models"
$vae = Join-Path $ComfyUIRoot "models\vae"
$text = Join-Path $ComfyUIRoot "models\text_encoders"

Ensure-Dir $diffusion
Ensure-Dir $vae
Ensure-Dir $text

$repo = "Comfy-Org/Wan_2.2_ComfyUI_Repackaged"

# Shared text encoder
Download-HF $repo "split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors" $text

if ($Profile -eq "ti2v5b") {
  Download-HF $repo "split_files/diffusion_models/wan2.2_ti2v_5B_fp16.safetensors" $diffusion
  Download-HF $repo "split_files/vae/wan2.2_vae.safetensors" $vae
}

if ($Profile -eq "i2v14b") {
  Download-HF $repo "split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" $diffusion
  Download-HF $repo "split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" $diffusion
  Download-HF $repo "split_files/vae/wan_2.1_vae.safetensors" $vae
}

Write-Host "Wan2.2 model installation complete for profile: $Profile"
Write-Host "ComfyUI root: $ComfyUIRoot"
