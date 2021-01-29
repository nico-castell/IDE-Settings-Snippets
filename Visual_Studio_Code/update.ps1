<#
    .SYNOPSIS
        This script updates the vscode settings in it's directory.
    .NOTES
        Author: nico-castell
#>
# This script was written by nico-castell.

[CmdletBinding()]
param ()

Push-Location
Set-Location $PSScriptRoot

# Ensure the source folder is present.
Write-Verbose "Testing presence of source folder..."
if (!(Test-Path -Path "$env:APPDATA\Code\User\")) {
    Write-Error "Visual Studio Code is not present in %appdata%" -Category ResourceUnavailable
    exit 1
}

# Copy all of the items
Write-Verbose "Copying items..."
Copy-Item -Path "$env:APPDATA\Code\User\settings.json" -Destination "$PSScriptRoot\settings.json"
Copy-Item -Path "$env:APPDATA\Code\User\keybindings.json" -Destination "$PSScriptRoot\keybindings-win.json"
Copy-Item -Path "$env:APPDATA\Code\User\snippets\*" -Destination "$PSScriptRoot\snippets\"

# Avoid the CRLF vs LF trap.
Write-Verbose "Renormalizing line endings..."
git add . --renormalize 2>&1 | Out-Null
Write-Verbose "Adding untracked files..."
git add . 2>&1 | Out-Null

Pop-Location
exit 0
