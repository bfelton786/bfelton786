<#
.SYNOPSIS
    Uninstalls Wireshark from the system executing the script.
    Tested on Wireshark Version 2.2.1 (v2.2.1-0-ga6fbd27 from master-2.2).
    Please test thoroughly in a non-production environment before deploying widely.
    Make sure to run as Administrator or with appropriate privileges.

.NOTES
    Author        : Brian Felton
    Date Created  : 2026-03-09
    Last Modified : 2026-03-09
    Version       : 1.0

.TESTED ON
    Date(s) Tested  : 2026-03-09
    Tested By       : Brian Felton
    Systems Tested  : Windows Server 2019 Datacenter, Build 1809
    PowerShell Ver. : 5.1.17763.6189
    Wireshark Ver.  : 2.2.1 (v2.2.1-0-ga6fbd27 from master-2.2)

.USAGE
    Example syntax:
    PS C:\> .\remediation-wireshark-uninstall.ps1 
#>
 
# Script to uninstall Wireshark

# Function to uninstall by DisplayName
function Uninstall-Program {
    param (
        [string]$ProgramName
    )

    Write-Host "Searching for $ProgramName..."

    # Look in 64-bit uninstall registry
    $uninstallKeys = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
                     "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"

    foreach ($key in $uninstallKeys) {
        $apps = Get-ItemProperty -Path $key\* -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*$ProgramName*" }
        foreach ($app in $apps) {
            if ($app.UninstallString) {
                Write-Host "Uninstalling $($app.DisplayName)..."
                
                # Some uninstall strings include "msiexec.exe /I{GUID}", replace /I with /X for uninstall
                $uninstallCmd = $app.UninstallString -replace "/I", "/X"

                # Start uninstall silently if possible
                Start-Process -FilePath "cmd.exe" -ArgumentList "/c $uninstallCmd /quiet /norestart" -Wait
                Write-Host "$($app.DisplayName) uninstall command executed."
            }
        }
    }
}

# Run the function for Wireshark
Uninstall-Program -ProgramName "Wireshark"

Write-Host "Wireshark uninstall process completed."
 
