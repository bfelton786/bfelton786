<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Brian Felton
    LinkedIn        : linkedin.com/in/brian-felton-22b2b03a8/
    GitHub          : github.com/bfelton786
    Date Created    : 2026-03-15
    Last Modified   : 2023-03-15
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 2026-03-15
    Tested By       : 2026-03-15
    Systems Tested  : bfelton-stig-vm
    PowerShell Ver. : PowerShell ISE

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-AU-000500.ps1 
#>

# Define the registry path and value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the key if it does not exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set MaxSize to 0x00008000 (32768 KB / 32 MB)
New-ItemProperty -Path $regPath -Name "MaxSize" -PropertyType DWord -Value 0x00008000 -Force
