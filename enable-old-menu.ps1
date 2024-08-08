# PackageName: Enable-Old-Menu
# Description: This script will enable the old right-click context menu in Windows 11.
# Author: Jonas Techand
# Version: 1.0
# Date: 2024-08-08
# --------------------------------------------------------------------------------------------
# Changelog: Script created
# --------------------------------------------------------------------------------------------

$ScriptName = enable-old-menu
Start-Transcript -Path $env:TEMP\Intune\$ScriptName.log -Append

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
function enable-old-context-menu {
    New-Item -Path "HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\" -Name "InprocServer32\" -force -value "\"
    Write-Host Restarting explorer.exe ...
    $process = Get-Process -Name explorer
    Stop-Process -InputObject $process
}
enable-old-context-menu
Write-Host "Script has completed successfully."

Stop-Transcript