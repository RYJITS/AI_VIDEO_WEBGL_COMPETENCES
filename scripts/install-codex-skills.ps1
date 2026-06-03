param(
  [string]$CodexSkillsRoot = "$env:USERPROFILE\.codex\skills"
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $repoRoot "codex-skills"

if (!(Test-Path $sourceRoot)) {
  throw "Source skills folder not found: $sourceRoot"
}

New-Item -ItemType Directory -Force -Path $CodexSkillsRoot | Out-Null

$skills = @("video-start-end", "webgl-right-video")
foreach ($skill in $skills) {
  $src = Join-Path $sourceRoot $skill
  $dst = Join-Path $CodexSkillsRoot $skill
  if (!(Test-Path $src)) { throw "Missing skill: $src" }
  if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
  Copy-Item -Recurse -Force $src $dst
  Write-Host "Installed Codex skill: $skill -> $dst"
}

Write-Host "Done. Restart Codex if the skills are not visible immediately."
