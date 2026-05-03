param(
    [string]$SourceDir = ".",
    [string]$OutputDir = ".publish-graph",
    [string[]]$PrivateTags = @("private", "私有"),
    [switch]$IncludeJournals = $false,
    [switch]$IncludeWhiteboards = $false
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
        $normalizedLine = $match.Groups[1].Value
        $normalizedLine = $normalizedLine.Replace('[[', ' ')
        $normalizedLine = $normalizedLine.Replace(']]', ' ')
        $normalizedLine = $normalizedLine.Replace('#', ' ')
        $normalizedLine = $normalizedLine.Replace(',', ' ')
        $values = $normalizedLine -split '\s+'
        foreach ($value in $values) {
            $normalized = $value.Trim()
            if ([string]::IsNullOrWhiteSpace($normalized)) {
                continue
            }
            foreach ($privateTag in $PrivateTags) {
                if ($normalized.Equals($privateTag, [System.StringComparison]::OrdinalIgnoreCase)) {
                    return $true
                }
            }
        }
    }

    return $false
}

function Copy-FileIfExists {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourcePath,
        [Parameter(Mandatory = $true)]
        [string]$DestinationPath
    )

    if (Test-Path -LiteralPath $SourcePath -PathType Leaf) {
        $destinationDir = Split-Path -Parent $DestinationPath
        if (-not (Test-Path -LiteralPath $destinationDir)) {
            New-Item -ItemType Directory -Path $destinationDir -Force | Out-Null
        }
        Copy-Item -LiteralPath $SourcePath -Destination $DestinationPath -Force
    }
}

function Remove-UnreferencedAssets {
    param(
        [Parameter(Mandatory = $true)]
        [string]$OutputRoot
    )

    $assetsRoot = Join-Path $OutputRoot "assets"
    if (-not (Test-Path -LiteralPath $assetsRoot)) {
        return @()
    }

    $referenceFiles = @()
    $referenceFiles += Get-ChildItem -Path (Join-Path $OutputRoot "pages") -Recurse -File -Filter *.md -ErrorAction SilentlyContinue
    $referenceFiles += Get-ChildItem -Path (Join-Path $OutputRoot "journals") -Recurse -File -Filter *.md -ErrorAction SilentlyContinue
    $referenceFiles += Get-ChildItem -Path (Join-Path $OutputRoot "whiteboards") -Recurse -File -Filter *.edn -ErrorAction SilentlyContinue
    $referenceFiles += Get-ChildItem -Path (Join-Path $OutputRoot "logseq") -Recurse -File -Include *.edn,*.css -ErrorAction SilentlyContinue

    $referenceText = ""
    foreach ($file in $referenceFiles) {
        $referenceText += "`n"
        $referenceText += Get-Content -LiteralPath $file.FullName -Raw -Encoding utf8
    }

    $removedAssets = @()
    $assetFiles = Get-ChildItem -Path $assetsRoot -Recurse -File
    foreach ($asset in $assetFiles) {
        $relativePath = $asset.FullName.Substring($OutputRoot.Length + 1).Replace('\', '/')
        $relativePathWithoutAssets = $asset.FullName.Substring($assetsRoot.Length + 1).Replace('\', '/')

        $isReferenced = $referenceText.Contains($relativePath) -or
            $referenceText.Contains("../$relativePath") -or
            $referenceText.Contains("./$relativePath") -or
            $referenceText.Contains($relativePathWithoutAssets)

        if (-not $isReferenced) {
            $removedAssets += $relativePath
            Remove-Item -LiteralPath $asset.FullName -Force
        }
    }

    Get-ChildItem -Path $assetsRoot -Directory -Recurse |
        Sort-Object FullName -Descending |
        Where-Object { -not (Get-ChildItem -LiteralPath $_.FullName -Force | Select-Object -First 1) } |
        Remove-Item -Force

    return $removedAssets
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

$foldersToCopy = @("assets", "pages")
if ($IncludeJournals) {
    $foldersToCopy += "journals"
}
if ($IncludeWhiteboards) {
    $foldersToCopy += "whiteboards"
}

foreach ($folder in $foldersToCopy) {
    Copy-IfExists -SourcePath (Join-Path $sourceRoot $folder) -DestinationPath (Join-Path $outputRoot $folder)
}

$logseqOutput = Join-Path $outputRoot "logseq"
New-Item -ItemType Directory -Path $logseqOutput -Force | Out-Null
Copy-FileIfExists -SourcePath (Join-Path $sourceRoot "logseq/config.edn") -DestinationPath (Join-Path $logseqOutput "config.edn")
Copy-FileIfExists -SourcePath (Join-Path $sourceRoot "logseq/custom.css") -DestinationPath (Join-Path $logseqOutput "custom.css")
Copy-FileIfExists -SourcePath (Join-Path $sourceRoot "logseq/publish.yml") -DestinationPath (Join-Path $logseqOutput "publish.yml")

$markdownFiles = Get-ChildItem -Path $outputRoot -Recurse -File -Filter *.md
$removedFiles = @()

foreach ($file in $markdownFiles) {
    if (Test-PrivateMarkdown -Path $file.FullName -PrivateTags $PrivateTags) {
        $removedFiles += $file.FullName.Substring($outputRoot.Length + 1)
        Remove-Item -LiteralPath $file.FullName -Force
    }
}

$removedAssets = Remove-UnreferencedAssets -OutputRoot $outputRoot

Get-ChildItem -Path $outputRoot -Recurse -File -Force -Filter ".DS_Store" -ErrorAction SilentlyContinue |
    Remove-Item -Force

Write-Host "Prepared publish graph at: $outputRoot"
if (-not $IncludeJournals) {
    Write-Host "Journals are excluded from publish output."
}
if (-not $IncludeWhiteboards) {
    Write-Host "Whiteboards are excluded from publish output."
}

if ($removedFiles.Count -gt 0) {
    Write-Host "Removed private markdown files:"
    $removedFiles | Sort-Object | ForEach-Object { Write-Host " - $_" }
} else {
    Write-Host "No private markdown files were removed."
}

if ($removedAssets.Count -gt 0) {
    Write-Host "Removed unreferenced assets:"
    $removedAssets | Sort-Object | ForEach-Object { Write-Host " - $_" }
} else {
    Write-Host "No unreferenced assets were removed."
}
