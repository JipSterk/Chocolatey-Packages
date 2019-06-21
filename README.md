# Chocolatey-Packages

## Bumping a package

- `certUtil -hashfile "name" sha256`
- replace the `$hashchecksum64` in [chocolateyinstall.ps1](unity-hub/tools/chocolateyinstall.ps1) with the newly generated hash
- execute `choco pack` in [unity-hub](unity-hub)
- execute `choco push` in [unity-hub](unity-hub)
