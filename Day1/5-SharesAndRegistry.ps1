#Get PSProviders
Get-PSProvider -PSProvider FileSystem 
<#
Name           Used (GB)     Free (GB) Provider      Root                                                                                                                          CurrentLocation 
----           ---------     --------- --------      ----                                                                                                                          --------------- 
C                  89.19          9.20 FileSystem    C:\                                                                                                                                      temp 
D                                      FileSystem    D:\
V                 125.18        374.69 FileSystem    \\invldncicmfs1.uk.corp.investec...
Z                                      FileSystem    \\invldncapp1\COShare
#>

# Mapping a share using powershell
New-psdrive -name "Z" -psprovider FileSystem -root "\\invldncapp1\COShare"
# Set the location to the new drive
Set-Location Z:

# browse the share
Get-ChildItem Z:\Citrix

# create a file on the share
New-Item -Path Z:\Citrix -Name "test.txt" -ItemType "File"

#disconnect the share
Remove-PSDrive -Name "Z" -Force

#other psdrive cmdlets
# Get-psdrive
# Get-psdrive -Name "C"

# Browse registry
Get-ChildItem HKLM:\SOFTWARE

# Get the value of a registry key
Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion

# Set the value of a registry key
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name "TestKey" -Value "TestValue"

#create a DWORD value inside the key
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name "TestDword" -Value 1 -PropertyType DWORD

# update the value of the DWORD
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name "TestDword" -Value 2

# delete the value
Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion -Name "TestDword" -Verbose

# delete the key
Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\ -Name "TestKey" -Verbose

