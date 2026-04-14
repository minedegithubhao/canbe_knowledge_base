param(
    [string]$RootDir = "."
)

$ErrorActionPreference = "Stop"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$patterns = @("*.md", "*.edn", "*.yml", "*.yaml", "*.css", "*.ps1")

$files = foreach ($pattern in $patterns) {
    Get-ChildItem -Path $RootDir -Recurse -File -Filter $pattern
}

$dotFiles = @(".gitignore", ".gitattributes", ".editorconfig") |
    ForEach-Object { Join-Path $RootDir $_ } |
    Where-Object { Test-Path -LiteralPath $_ } |
    ForEach-Object { Get-Item -LiteralPath $_ }

($files + $dotFiles) |
    Sort-Object -Property FullName -Unique |
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' } |
    ForEach-Object {
        $content = [System.IO.File]::ReadAllText($_.FullName)
        [System.IO.File]::WriteAllText($_.FullName, $content, $utf8NoBom)
    }

Write-Host "Normalized text files to UTF-8 without BOM."
