<#
    .SYNOPSIS
        This script updates the vscode settings in it's directory.
    .NOTES
        Author: nico-castell
#>
# This script was written by nico-castell.

Push-Location
Set-Location $PSScriptRoot

# Ensure the source folder is present.
if (!(Test-Path -Path "$env:APPDATA\Code\User\")) {
    Write-Error "Visual Studio Code is not present in %appdata%" -Category ResourceUnavailable
    exit 1
}

# Copy all of the items
Copy-Item -Path "$env:APPDATA\Code\User\settings.json" -Destination "$PSScriptRoot\settings.json"
Copy-Item -Path "$env:APPDATA\Code\User\keybindings.json" -Destination "$PSScriptRoot\keybindings-win.json"
Copy-Item -Path "$env:APPDATA\Code\User\snippets\*" -Destination "$PSScriptRoot\snippets\*"

# Avoid the CRLF vs LF trap.
git add . --renormalize

Pop-Location
exit 0
