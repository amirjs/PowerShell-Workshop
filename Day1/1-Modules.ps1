# Brief History of PowerShell
# PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language. Initially a Windows component only, known as Windows PowerShell, it was made open-source and cross-platform on 18 August 2016 with the introduction of PowerShell Core. The former is built on the .NET Framework, the latter on .NET Core. PowerShell provides full access to COM and WMI, enabling administrators to perform administrative tasks on both local and remote Windows systems as well as WS-Management and CIM enabling management of remote Linux systems and network devices.
# PowerShell includes its own extensive, console-based help 
# PowerShell supports the concept of a profile to configure the shell.
# PowerShell is extensible, users can add commands via modules.
# PowerShell includes a scripting language, and a framework for building scripts, making it a tool for automating tasks.

# 3 reasons to learn PowerShell (Actually 4!)
https://www.youtube.com/watch?v=5m-co2k4dyY

# what modules comes out of the box with windows 11
# how to find out what modules are available
Get-Module -ListAvailable

<#
| Module Name                     | Description                                                                 |
|---------------------------------|-----------------------------------------------------------------------------|
| Microsoft.PowerShell.Archive    | Cmdlets for working with ZIP files (Compress-Archive, Expand-Archive)       |
| Microsoft.PowerShell.Diagnostics| Tools for working with event logs and performance counters                 |
| Microsoft.PowerShell.Host       | Interfaces for host management                                             |
| Microsoft.PowerShell.LocalAccounts | Manage local users and groups (New-LocalUser, etc.)                     |
| Microsoft.PowerShell.Management | Core management cmdlets (files, services, registry, etc.)                  |
| Microsoft.PowerShell.Security   | Security-related cmdlets (certificates, credentials)                       |
| Microsoft.PowerShell.Utility    | Core cmdlets like Out-File, Format-Table, Select-Object, etc.              |
| Microsoft.WSMan.Management      | Manages WinRM and remoting                                                 |
| PackageManagement               | Interfaces with package providers (used with PowerShellGet)                |
| PowerShellGet                   | For installing modules from the PowerShell Gallery                         |
| PSDiagnostics                   | Diagnostics and tracing (less commonly used)                               |
| PSReadline                      | Enhances the shell experience (syntax coloring, command history, etc.)     |
| CimCmdlets                      | Access WMI data via CIM (Common Information Model)                         |
| Microsoft.PowerShell.Core       | Underlying core cmdlets (usually loaded implicitly)                        |

#>

# where are they stored
$env:PSModulePath

# Find out where each module is stored
Get-Module -ListAvailable | Select-Object Name, Path

# find out what is a repository 
Get-PSRepository

#what are the common repositories
# PSGallery

#set ps gallery as a trusted repository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# how to brwose the gallery
Find-Module -Repository PSGallery

# search for a module
Find-Module -Repository PSGallery -Name PSWindowsUpdate

#install a module from the gallery
Install-Module -Name PSWindowsUpdate

# what are the package providers
Get-PackageProvider

# What are package management providers
# Chocolatey, NuGet, PowerShellGet, etc.
Get-PackageSource

<#
## Difference Between Get-PackageProvider and Get-PackageSource

| Command              | What it Shows                              | Purpose                                                   |
|----------------------|--------------------------------------------|-----------------------------------------------------------|
| `Get-PackageProvider` | Lists package providers available          | Shows which types of packages PowerShell can manage       |
| `Get-PackageSource`   | Lists sources/repositories for those providers | Shows where packages are pulled from                     |

---

###  Get-PackageProvider

Think of a provider as the engine that knows how to handle a specific type of package.
It goes to the source and brings back the package.

**Command:**

```powershell
Get-PackageProvider

Name                     Version      Source
----                     -------      ------
msi                      3.0.0.0
msu                      3.0.0.0
NuGet                    2.8.5.208
PowerShellGet            1.0.0.1
Programs                 3.0.0.0


🌍 Get-PackageSource
A package source is a repository or feed URL used by a provider to find packages.

Sources belong to specific providers.

Get-PackageSource

Name               ProviderName     IsTrusted  Location
----               ------------     ---------  --------
PSGallery          PowerShellGet    True       https://www.powershellgallery.com/api/v2/
nuget.org          NuGet            False      https://api.nuget.org/v3/index.json

🧠 Use Case: You want to see where PowerShell is pulling packages from (e.g., PowerShell Gallery, NuGet).

#>
#lets visit the powershell gallery and see which module is most downloaded
https://www.powershellgallery.com/

lets installed ps windows update
Install-Module -Name PSWindowsUpdate 

<#

Untrusted repository
You are installing the modules from an untrusted repository. If you trust this repository, change its 
InstallationPolicy value by running the Set-PSRepository cmdlet. Are you sure you want to install the modules 
from 'PSGallery'?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): 

#>

# what are the commands that come with the module
Get-Command -Module PSWindowsUpdate

<#
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           Clear-WUJob                                        2.2.1.5    PSWindowsUpdate
Alias           Download-WindowsUpdate                             2.2.1.5    PSWindowsUpdate
Alias           Get-WUInstall                                      2.2.1.5    PSWindowsUpdate
Alias           Get-WUList                                         2.2.1.5    PSWindowsUpdate
Alias           Hide-WindowsUpdate                                 2.2.1.5    PSWindowsUpdate
Alias           Install-WindowsUpdate                              2.2.1.5    PSWindowsUpdate
Alias           Show-WindowsUpdate                                 2.2.1.5    PSWindowsUpdate
Alias           UnHide-WindowsUpdate                               2.2.1.5    PSWindowsUpdate
Alias           Uninstall-WindowsUpdate                            2.2.1.5    PSWindowsUpdate
Cmdlet          Add-WUServiceManager                               2.2.1.5    PSWindowsUpdate
Cmdlet          Enable-WURemoting                                  2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WindowsUpdate                                  2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUApiVersion                                   2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUHistory                                      2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUInstallerStatus                              2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUJob                                          2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WULastResults                                  2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUOfflineMSU                                   2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WURebootStatus                                 2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUServiceManager                               2.2.1.5    PSWindowsUpdate
Cmdlet          Get-WUSettings                                     2.2.1.5    PSWindowsUpdate
Cmdlet          Invoke-WUJob                                       2.2.1.5    PSWindowsUpdate
Cmdlet          Remove-WindowsUpdate                               2.2.1.5    PSWindowsUpdate
Cmdlet          Remove-WUServiceManager                            2.2.1.5    PSWindowsUpdate
Cmdlet          Reset-WUComponents                                 2.2.1.5    PSWindowsUpdate
Cmdlet          Set-PSWUSettings                                   2.2.1.5    PSWindowsUpdate
Cmdlet          Set-WUSettings                                     2.2.1.5    PSWindowsUpdate
Cmdlet          Update-WUModule                                    2.2.1.5    PSWindowsUpdate

#>
# what are the aliases that come with the module
# find the original command of the alias
Get-Alias Get-WUList | Format-List

# find out what the command does
Get-Help Get-WUList

# what are the parameters of the command
Get-Help Get-WUList -Detailed

#let's run it!
# Let's run a modified version of example 2
Get-WindowsUpdate -IsInstalled -ShowPreSearchCriteria -Verbose

<#
PreSearchCriteria: IsInstalled = 1 and IsHidden = 0
VERBOSE: DESKTOP-4CJSR2B (25/03/2025 22:20:41): Connecting to Microsoft Update server. Please wait...
VERBOSE: Found [15] Updates in pre search criteria
VERBOSE: Found [15] Updates in post search criteria

ComputerName Status     KB          Size Title
------------ ------     --          ---- -----
DESKTOP-4... -DI----    KB925673     2MB MSXML 6.0 RTM Security Update  (925673)
DESKTOP-4... -DI----    KB3152281   46MB Click-to-Run Update Support
DESKTOP-4... -DI----    KB4052623    5MB Update for Windows Defender Antivirus antimalware platform - KB4052623 (Version 4.18.20... 
DESKTOP-4... -DI----                93MB Windows Admin Center 2311
DESKTOP-4... -DI----    KB5039844   55MB 2024-05 .NET 7.0.20 Security Update for x64 Client (KB5039844)
DESKTOP-4... -DI----               103MB PowerShell v7.4.3 (x64)
DESKTOP-4... -DI----    KB5047486   50MB 2024-11 .NET 6.0.36 Update for x64 Client (KB5047486)
DESKTOP-4... -DI----    KB5007651   38MB Update for Windows Security platform - KB5007651 (Version 10.0.27703.1006)
DESKTOP-4... -DI----    KB890830    78MB Windows Malicious Software Removal Tool x64 - v5.132 (KB890830)
DESKTOP-4... -DI----               103MB PowerShell LTS v7.4.7 (x64)
DESKTOP-4... -DI----    KB5054229  107MB 2025-03 .NET 8.0.14 Security Update for x64 Client (KB5054229)
DESKTOP-4... -DI----    KB4052623   14MB Update for Microsoft Defender Antivirus antimalware platform - KB4052623 (Version 4.18.... 
DESKTOP-4... -DI----    KB2267602    1GB Security Intelligence Update for Microsoft Defender Antivirus - KB2267602 (Version 1.42... 
DESKTOP-4... --I----    KB5049622  142MB 2025-01 Cumulative Update for .NET Framework 3.5 and 4.8.1 for Windows 11, version 24H2... 
DESKTOP-4... -DI----    KB5053598   86GB 2025-03 Cumulative Update for Windows 11 Version 24H2 for x64-based Systems (KB5053598) 
#>

# Challenge 1: List all available modules and their paths
# Task: Write a script to list all available modules on your system along with their paths.
# Hint: Use Get-Module with Select-Object to display the Name and Path properties.

# Challenge 2: Find and install a module from the PowerShell Gallery
# Task: Search for a module named "Az" in the PowerShell Gallery and install it.
# Hint: Use Find-Module and Install-Module cmdlets.

# Challenge 3: Explore commands in a module
# Task: After installing the "Az" module, list all the commands available in the module and find detailed help for one of them.
# Hint: Use Get-Command and Get-Help cmdlets.











