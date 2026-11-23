<#
Manual installer for eng-team (skill + agents).
Usage: scripts\install.ps1 [-Force] [-TargetDir <path>]
Default TargetDir: ~/.claude
#>
param(
  [switch]$Force,
  [string]$TargetDir = (Join-Path $HOME '.claude')
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$skillSrc = Join-Path $root 'skills\eng-team'
$skillDst = Join-Path $TargetDir 'skills\eng-team'
$agentsDst = Join-Path $TargetDir 'agents'
if (-not (Test-Path $skillSrc)) { throw "$skillSrc not found" }

$agents = Get-ChildItem (Join-Path $root 'agents') -Filter *.md
$conflicts = @()
if (Test-Path $skillDst) { $conflicts += $skillDst }
foreach ($a in $agents) {
  $d = Join-Path $agentsDst $a.Name
  if (Test-Path $d) { $conflicts += $d }
}
if ($conflicts.Count -gt 0 -and -not $Force) {
  Write-Host 'Refusing to overwrite existing files (use -Force to overwrite):'
  $conflicts | ForEach-Object { Write-Host "  $_" }
  exit 2
}

New-Item -ItemType Directory -Force -Path $skillDst, $agentsDst | Out-Null
Copy-Item -Path (Join-Path $skillSrc '*') -Destination $skillDst -Recurse -Force
Write-Host "Installed skill:  $skillDst"
foreach ($a in $agents) {
  Copy-Item $a.FullName $agentsDst -Force
  Write-Host "Installed agent:  $(Join-Path $agentsDst $a.Name)"
}
Write-Host 'Done. Restart Claude Code, then run: /eng-team <task>'
