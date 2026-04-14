param(
    [string]$SourceDir = ".",
    [string]$OutputDir = ".publish-graph",
    [string[]]$PrivateTags = @("private", "私有"),
    [switch]$IncludeJournals = $false
)

$ErrorActionPreference = "Stop"

function Test-PrivateMarkdown {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string[]]$PrivateTags
    )

    $content = Get-Content -LiteralPath $Path -Raw -Encoding utf8

    if ($content -match '(?im)^\s*private::\s*(true|yes|1)\s*$') {
        return $true
    }

    if ($content -match '(?im)^\s*public::\s*false\s*$') {
        return $true
    }

    $tagLines = [regex]::Matches($content, '(?im)^\s*tags::\s*(.+)$')
    foreach ($match in $tagLines) {
        $values = $match.Groups[1].Value -split ','
        foreach ($value in $values) {
            $normalized = $value.Trim().TrimStart('#')
            foreach ($privateTag in $PrivateTags) {
                if ($normalized.Equals($privateTag, [System.StringComparison]::OrdinalIgnoreCase)) {
                    return $true
                }
            }
        }
    }

    return $false
}

function Copy-IfExists {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourcePath,
        [Parameter(Mandatory = $true)]
        [string]$DestinationPath
    )

    if (Test-Path -LiteralPath $SourcePath) {
        Copy-Item -LiteralPath $SourcePath -Destination $DestinationPath -Recurse -Force
    }
}

$sourceRoot = (Resolve-Path $SourceDir).Path
$outputRoot = Join-Path $sourceRoot $OutputDir

if (Test-Path -LiteralPath $outputRoot) {
    Remove-Item -LiteralPath $outputRoot -Recurse -Force
}

New-Item -ItemType Directory -Path $outputRoot | Out-Null

$foldersToCopy = @("assets", "pages", "whiteboards", "logseq")
if ($IncludeJournals) {
    $foldersToCopy += "journals"
}

foreach ($folder in $foldersToCopy) {
    Copy-IfExists -SourcePath (Join-Path $sourceRoot $folder) -DestinationPath (Join-Path $outputRoot $folder)
}

$markdownFiles = Get-ChildItem -Path $outputRoot -Recurse -File -Filter *.md
$removedFiles = @()

foreach ($file in $markdownFiles) {
    if (Test-PrivateMarkdown -Path $file.FullName -PrivateTags $PrivateTags) {
        $removedFiles += $file.FullName.Substring($outputRoot.Length + 1)
        Remove-Item -LiteralPath $file.FullName -Force
    }
}

Write-Host "Prepared publish graph at: $outputRoot"
if (-not $IncludeJournals) {
    Write-Host "Journals are excluded from publish output."
}

if ($removedFiles.Count -gt 0) {
    Write-Host "Removed private markdown files:"
    $removedFiles | Sort-Object | ForEach-Object { Write-Host " - $_" }
} else {
    Write-Host "No private markdown files were removed."
}
