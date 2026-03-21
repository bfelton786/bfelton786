<#
.SYNOPSIS
    This PowerShell script ensures that the DisablePasswordSaving = 1 → Prevents saving RDP credentials, reducing the risk of credential theft.

.NOTES
    Author          : Brian Felton
    LinkedIn        : linkedin.com/in/brian-felton-22b2b03a8/
    GitHub          : github.com/bfelton786
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         :  WN11-CC-000270

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : 2026-03-21
    Systems Tested  : bfelton-stig-vm
    PowerShell Ver. : PowerShell ISE

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000270.ps1 
#>

# Define the registry path and value
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Force | Out-Null

# Set DisablePasswordSaving to 1
Set-ItemProperty `
  -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" `
  -Name "DisablePasswordSaving" `
  -Value 1 `
  -Type DWord `
  -Force
