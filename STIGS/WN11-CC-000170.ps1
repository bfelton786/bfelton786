<#
.SYNOPSIS
    This PowerShell script ensures that the MSAOptional = 1 → Allows Microsoft accounts to be optional (reduces enforcement of Microsoft account sign-in)

.NOTES
    Author          : Brian Felton
    LinkedIn        : linkedin.com/in/brian-felton-22b2b03a8/
    GitHub          : github.com/bfelton786
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000170

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : 2026-03-21
    Systems Tested  : bfelton-stig-vm
    PowerShell Ver. : PowerShell ISE

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000170.ps1 
#>

# Define the registry path and value
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | Out-Null

# Set MSAOptional to 1
Set-ItemProperty `
  -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
  -Name "MSAOptional" `
  -Value 1 `
  -Type DWord `
  -Force
