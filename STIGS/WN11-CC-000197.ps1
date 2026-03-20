<#
.SYNOPSIS
    This PowerShell script ensures that the DisableWindowsConsumerFeatures = 1 → Disables consumer features

.NOTES
    Author          : Brian Felton
    LinkedIn        : linkedin.com/in/brian-felton-22b2b03a8/
    GitHub          : github.com/bfelton786
    Date Created    : 2026-03-20
    Last Modified   : 2026-03-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000197

.TESTED ON
    Date(s) Tested  : 2026-03-20
    Tested By       : 2026-03-20
    Systems Tested  : bfelton-stig-vm
    PowerShell Ver. : PowerShell ISE

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000197.ps1 
#>

# Define the registry path and value
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null

# Set DisableWindowsConsumerFeatures to 1 (enabled)
Set-ItemProperty `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" `
  -Name "DisableWindowsConsumerFeatures" `
  -Value 1 `
  -Type DWord `
  -Force
