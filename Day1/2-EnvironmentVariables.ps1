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
#>








# Challenge 1: Create a new environment variable and use it to store a custom directory path.
# Then, create a new file in that directory and list all files in it.

# Challenge 2: Modify the PATH environment variable temporarily by appending a new directory.
# Verify that the new directory is included in the PATH variable.

# Challenge 3: Retrieve and display all environment variables that contain the word "TEMP".


