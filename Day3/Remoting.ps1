# Enabling PowerShell Remoting on the target machine if not already enabled
Enable-PSRemoting -Force


# Invoke-Command -ComputerName <ComputerName> -ScriptBlock { <Script> }

Invoke-Command -ComputerName "RemotePC" -ScriptBlock { Get-Process }

#Running a Script from a Local File on a Remote Computer
$script = { param($path) Get-ChildItem -Path $path }
Invoke-Command -ComputerName "RemotePC" -ScriptBlock $script -ArgumentList "C:\"

#Running a Command on Multiple Remote Computers
$computers = "RemotePC1", "RemotePC2"
Invoke-Command -ComputerName $computers -ScriptBlock { Get-Service }

#Using Credentials for Remote Execution
$cred = Get-Credential
Invoke-Command -ComputerName "RemotePC" -ScriptBlock { Get-EventLog -LogName System } -Credential $cred

