$ErrorActionPreference = 'Stop';

$packageName = "unity-hub"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = "https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe"
$checksum64 = "e539f45cc2ecd327caebba59f82ef69a83ac3a7c9b2d566a7bcecc0ed79bbcd1"

$args = "/S"

$pp = Get-PackageParameters
if ($pp.InstallationPath) {
    $args += " /D=$($pp.InstallationPath)"
    Write-Host "Param: installing to $($pp.InstallationPath)"
}

$packageArgs = @{
    packageName    = $packageName
    fileType       = "EXE"
    url64bit       = $url64
    softwareName   = "Unity Hub"
    checksum64     = $checksum64
    checksumType64 = 'sha256'
    silentArgs     = $args
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs