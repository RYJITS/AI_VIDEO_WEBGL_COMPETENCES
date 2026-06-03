param(
  [string]$CerveauRoot = "D:\00_Cerveau_IA"
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$src = Join-Path $repoRoot "cerveau-competence\competence-video-start-end-webgl"
$targetRoot = Join-Path $CerveauRoot "Conpetances\Video"
$dst = Join-Path $targetRoot "competence-video-start-end-webgl"

if (!(Test-Path $src)) { throw "Missing competence source: $src" }
New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
Copy-Item -Recurse -Force $src $dst
Write-Host "Installed Cerveau competence -> $dst"

$packageJson = Join-Path $CerveauRoot "Conpetances\package.json"
if (Test-Path $packageJson) {
  Push-Location (Join-Path $CerveauRoot "Conpetances")
  try {
    npm run memoire:update
  } finally {
    Pop-Location
  }
} else {
  Write-Host "package.json not found, memory index update skipped."
}
