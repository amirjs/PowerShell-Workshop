#Environment variables, piping, and basic commands like get-process, get-service, get-childitem

# Environment variables are dynamic named values that can affect the way running processes will behave on a computer.

# List all environment variables
Get-ChildItem Env:

#these correspond to the user and system environment variables that you can find in the System Properties dialog in the Control Panel

# Access one
$env:PATH

# Create a new one (temporary!)
$env:MYVAR = "C:\Temp"
Write-Output $env:MYVAR

# place some files in the directory and list them
Get-ChildItem $env:MYVAR

# Get-childitem is the equivalent of the dir command in cmd.exe
# You can also use the dir command in PowerShell, but it is an alias for Get-ChildItem

# Remove the variable
Remove-Item Env:\MYVAR

# select the temp environment variables
Get-ChildItem Env:*TEMP* 

# select the name attribute of the environment variables that contain the word "TEMP"
Get-ChildItem Env:*TEMP* | Select-Object -Property Name

# what is piping in PowerShell?
# Piping (|) in PowerShell is the act of passing the output of one command as the input to another command.
# This allows you to chain commands together to perform more complex operations.

#Get all services
Get-Service

<#
Status   Name               DisplayName
------   ----               -----------
Stopped  AarSvc_17056d      Agent Activation Runtime_17056d
Running  AdobeARMservice    Adobe Acrobat Update Service
Stopped  ALG                Application Layer Gateway Service
Stopped  AppIDSvc           Application Identity
Running  Appinfo            Application Information
Running  AppMgmt            Application Management
Stopped  appprotectionsvc   AppProtection Service

#>
# Get all services that are running
Get-Service | Where-Object {$_.Status -eq "Running"}

<#
🤔 What is $_ in a Pipeline?
$_ is a special variable in PowerShell that means “the current object in the pipeline.” or "This" in other programming languages.

When you're inside a script block like { ... }, and you're using a command like Where-Object, PowerShell is looping through each item passed through the pipe — and $_ represents that item.

So when piping, there is an implicit loop over the objects in the pipeline, and $_ refers to the current object in that loop.

🔍 What Does $_ Contain?
The $_ variable contains the current object in the pipeline. It is a placeholder for the current object in the pipeline.
#>

#let's try get-process
Get-Process 1Password
#pipe to format-table
Get-Process explorer | Format-Table name, id, cpu, starttime

# Why I don't need $_ with format-table?
#Format-Table is a cmdlet that formats the output of a command as a table. It doesn't need to access the current object in the pipeline because it's not filtering or selecting objects.



<#
Name       Id         CPU StartTime
----       --         --- ---------
explorer 1844 6779.421875 17/03/2025 08:04:26
#>

# does get-process show all attributes by default?
# No, it doesn't. It shows a subset of the attributes by default.
Get-Process explorer | Format-List *

#let's select some of the attributes/properties
Get-Process explorer | Format-List name, id, cpu, starttime

#let out the results to a file
Get-Process explorer | Format-List name, id, cpu, starttime | Out-File -FilePath C:\Temp\explorer.txt

#let's open the file in notepad
notepad C:\Temp\explorer.txt

#how come Notepad was recognized as a command?
#Notepad is an executable file located in the Windows directory. PowerShell automatically searches the directories in the PATH environment variable for executable files.



# Challenge 1: Create a new environment variable and use it to store a custom directory path.
# Then, create a new file in that directory and list all files in it.

# challange 2: Get all processes using more than 100MB memory and display their names and memory usage.

# challange 3: find a command that gets event logs on your system using find-command and use it to get the last 10 event logs.
# Hint: find-command, get-help
 

<#
 Day 1: 1-IntroductionToPowerShell
 Day 1: 2-EnvironmentVariables
 Day 1: 3-FilesAndFolders
 Day 1: 4-TextFiles
 Day 1: 5-Processes
 Day 1: 6-Services
 Day 1: 7-Registry
 Day 1: 8-Modules
 Day 1: 9-Scripts
 Day 1: 10-Debugging
 Day 1: 11-ErrorHandling
 Day 1: 12-Profile
 Day 1: 13-RemoteManagement
 Day 1: 14-SSHRemoting
 Day 1: 15-WebRequests
 Day 1: 16-RESTAPI
 Day 1: 17-DataFormats
 Day 1: 18-Webscraping
 Day 1: 19-PowerShellGallery
 Day 1: 20-UseCases
 Day 1: 21-LabEnvironment
 Day 1: 22-Commands
 Day 1: 23-Resources
 Day 1: 24-Conclusion
#>