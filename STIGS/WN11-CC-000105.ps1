<#
.SYNOPSIS
    This PowerShell script ensures that the NoWebServices = 1 → Disables Windows web-based services in Explorer (like Bing search in the Start menu), improving privacy and reducing potential attack surface.

.NOTES
    Author          : Brian Felton
    LinkedIn        : linkedin.com/in/brian-felton-22b2b03a8/
    GitHub          : github.com/bfelton786
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000105

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : 2026-03-21
    Systems Tested  : bfelton-stig-vm
    PowerShell Ver. : PowerShell ISE

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000105.ps1 
#>

# Define the registry path and value
# Ensure the registry path exists
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | Out-Null

# Set NoWebServices to 1
Set-ItemProperty `
  -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
  -Name "NoWebServices" `
  -Value 1 `
  -Type DWord `
  -Force
