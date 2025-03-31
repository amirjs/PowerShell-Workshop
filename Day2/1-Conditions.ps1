<#
# 🧠 PowerShell Workshop – Day 2  
### Topics: Conditions, Error Handling, Loops (PowerShell 5.1)

---

## 🔸 Part 1: Conditionals – `if`, `elseif`, `else`

### ✅ Concept
Conditional statements let you execute code based on `True` or `False` evaluations.

### 🔹 Syntax
```powershell
if (<condition>) {
    # code to run if condition is true
} elseif (<another condition>) {
    # code to run if previous was false, and this is true
} else {
    # code to run if none are true
}


#>


$age = 20

if ($age -lt 18) {
    Write-Output "You are a minor."
} elseif ($age -ge 18 -and $age -lt 65) {
    Write-Output "You are an adult."
} else {
    Write-Output "You are a senior citizen."
}


# example 2: check if a service is stopped and if yes, start it
$ServiceName = "wuauserv"
$service = Get-Service -Name $ServiceName

if ($service.Status -eq "Stopped") {
    Start-Service -Name $ServiceName -Verbose
}
else {
    Write-Output "$ServiceName is already running."
}

# Example 3 : check if a reg key exists and if not create it
$Regvalue = "TestKey"
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion"
$CheckRegValue = get-itemproperty -path $RegPath -name $Regvalue -ErrorAction SilentlyContinue

if ($null -eq $CheckRegValue) {
    New-ItemProperty -Path $RegPath -Name $Regvalue -Value "TestValue" -PropertyType String
    Write-Output "Registry key created successfully"
}
else {
    Write-Output "Registry key already exists"
}

#Example 4 : Check if a service is running and a regkey is in place
$ServiceName = "wuauserv"
$Regvalue = "TestKey"
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion"
$service = Get-Service -Name $ServiceName
$CheckRegValue = get-itemproperty -path $RegPath -name $Regvalue -ErrorAction SilentlyContinue
if ($service -ne "Stopped" -and $CheckRegValue -ne $null) {
    write-host "The service $($service.name) is running and $($CheckRegValue.TestKey) exists"
}


# Example 5: if -not and Or condition
$age = 25

if (-not ($age -lt 18) -or ($age -gt 65)) {
    Write-Output "You are not a minor or a senior citizen."
}
elseif ($age -eq 35) {
    Write-Output ""
}

#challenge 1: check if a service is running and if yes, stop it