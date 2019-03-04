$ErrorActionPreference = "Stop";

$packageName = "pure-vpn"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = "https://s3.amazonaws.com/purevpn-dialer-assets/windows/app/purevpn_setup.exe"
$checksum = "b4ed1dd010aecf68af30358cc32ec7e1"

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
    checksumType   = "md5"
    silentArgs     = $args
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs