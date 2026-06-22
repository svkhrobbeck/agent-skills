# Repo ichidagi barcha skill'larni ~/.claude/skills/ ga o'rnatadi (Windows).
# Har bir skill = SKILL.md fayli bo'lgan papka.
$ErrorActionPreference = 'Stop'

$srcDir  = Join-Path $PSScriptRoot 'skills'
$destDir = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME '.claude/skills' }

New-Item -ItemType Directory -Force -Path $destDir | Out-Null

$count = 0
Get-ChildItem -Path $srcDir -Directory | Where-Object {
    Test-Path (Join-Path $_.FullName 'SKILL.md')
} | ForEach-Object {
    $target = Join-Path $destDir $_.Name
    if (Test-Path $target) { Remove-Item -Recurse -Force $target }
    Copy-Item -Recurse $_.FullName $target
    Write-Host "  installed: $($_.Name)"
    $count++
}

Write-Host "Done. $count skill(s) -> $destDir"
