$ErrorActionPreference = "Stop";

$packageName = "pure-vpn"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://s3.amazonaws.com/purevpn-dialer-assets/windows/app/purevpn_setup.exe"
$checksum = "ff8bf0f341d07da58c289a80954c5627a29a6644657be03050ce661510196c7e"

$args = "/S"

$pp = Get-PackageParameters
if ($pp.InstallationPath) {
    $args += " /D=$($pp.InstallationPath)"
    Write-Host "Param: installing to $($pp.InstallationPath)"
}

$packageArgs = @{
    packageName    = $packageName
    fileType       = "EXE"
    url            = $url
    softwareName   = "Pure vpn"
    checksum       = $checksum
    checksumType   = "sha256"
    silentArgs     = $args
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs