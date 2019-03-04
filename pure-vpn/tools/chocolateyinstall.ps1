$ErrorActionPreference = "Stop";

$packageName = "pure-vpn"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://s3.amazonaws.com/purevpn-dialer-assets/windows/app/purevpn_setup.exe"
$checksum = "daf32ec434ea5469af7183d68d939748ef7a583aa0d9657f7f1602e32f527b31"

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