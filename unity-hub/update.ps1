$url64 = "https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe"
#$checksum64 = "691f6e13165ce0e2e8a97ae119d3a00f47a32b3abb69f2fa22121e91429915f1"
$exeFile = Join-Path $env:TEMP "UnityHubSetup.exe"

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*[$]url64\s*=\s*)(.*)" = "`$1""$($Latest.URL64)"""
            "(?i)(^\s*[$]checksum64\s*=\s*)(.*)" = "`$1""$($Latest.Checksum64)"""
        }
    }
}

function global:au_GetLatest {
    Invoke-WebRequest -Uri $url64 -OutFile $exeFile
    $version = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($exeFile).FileVersion
    return @{ Version = $version; URL64 = $url64 }
}

update -ChecksumFor 64
