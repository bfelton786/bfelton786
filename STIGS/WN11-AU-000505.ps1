<#
.SYNOPSIS
    This PowerShell script ensures that the MaxSize = 1024000 → Sets the maximum size of the Security event log (~1 GB)

.NOTES
    Author          : Brian Felton
    LinkedIn        : linkedin.com/in/brian-felton-22b2b03a8/
    GitHub          : github.com/bfelton786
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000505

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : 2026-03-21
    Systems Tested  : bfelton-stig-vm
    PowerShell Ver. : PowerShell ISE

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000505.ps1 
#>

# Define the registry path and value
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" -Force | Out-Null

# Set MaxSize to 1024000 (or greater)
Set-ItemProperty `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" `
  -Name "MaxSize" `
  -Value 1024000 `
  -Type DWord `
  -Force
