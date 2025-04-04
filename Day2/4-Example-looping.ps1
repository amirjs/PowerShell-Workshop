$filePath = "C:\temp\file.txt"
# if the file does not exist, create it
if (-not (Test-Path -Path $filePath)) {
    New-Item -Path $filePath -ItemType File
}
# add content to the file until the size is 10 kb
do {    
    Write-Host "File size: $((Get-Item $filePath).length) bytes"
    Add-Content -Path $filePath -Value "Hello World"
    Start-Sleep -Seconds 1
} while ((Get-Item $filePath).length -lt 5kb)