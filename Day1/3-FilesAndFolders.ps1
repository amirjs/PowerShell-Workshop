# PowerShell File and Folder Operations Walkthrough

#Change your shell location for this session
Set-location c:\temp\
# 1. Creating a New Folder
# Scenario: Create a new folder named "TestFolder" in the current directory.
New-Item -Path . -Name "TestFolder" -ItemType "Directory"

# 2. Creating a New File
# Scenario: Create a new text file named "example.txt" inside "TestFolder".
New-Item -Path .\TestFolder -Name "example.txt" -ItemType "File"

# 3. Writing to a File
# Scenario: Write the text "Hello, World!" to "example.txt".
Set-Content -Path .\TestFolder\example.txt -Value "Hello, World!"

# 4. Reading from a File
# Scenario: Read the contents of "example.txt".
Get-Content -Path .\TestFolder\example.txt

# 5. Appending to a File
# Scenario: Append the text "This is a new line." to "example.txt".
Add-Content -Path .\TestFolder\example.txt -Value "This is a new line."
Get-Content -Path .\TestFolder\example.txt

# 6. Renaming a File
# Scenario: Rename "example.txt" to "example-renamed.txt".
Rename-Item -Path .\TestFolder\example.txt -NewName "example-renamed.txt"

# 7. Copying a File
# Scenario: Copy "example-renamed.txt" to "example-copy.txt".
Copy-Item -Path .\TestFolder\example-renamed.txt -Destination .\TestFolder\example-copy.txt

# 8. Moving a File
# Scenario: Move "example-copy.txt" to the parent directory.
Move-Item -Path .\TestFolder\example-copy.txt -Destination .\example-copy.txt

# 9. Deleting a File
# Scenario: Delete "example-renamed.txt".
Remove-Item -Path .\TestFolder\example-renamed.txt

# 10. Deleting a Folder
# Scenario: Delete "TestFolder" and all its contents.
Remove-Item -Path .\TestFolder -Recurse

# 11. Listing Files and Folders and moving files
Set-Location .\TestFolder
new-item Archive -ItemType Directory
get-childitem exam* | move-item -Destination .\Archive

get-help move-item -Examples

get-item psw* | move-item -Destination .\TestFolder

# Challenge 1:
# Write a PowerShell script that creates a new folder named "Logs" in the current directory and then creates a new text file named "log.txt" inside the "Logs" folder. Finally, write the current date and time to the "log.txt" file.

# Challenge 2:
# Write a PowerShell script that renames all the files in a given directory to include a timestamp in the format "YYYY-MM-DD_HH-MM-SS". For example, if the directory contains a file named "example.txt", it should be renamed to "example_2022-01-01_12-30-45.txt".

# Challenge 3:
# Write a PowerShell script that recursively searches a given directory for all files with a specific file extension (e.g., ".txt") and moves them to a new folder named "Archive". 

# Challenge 4:
# Write a PowerShell script that deletes all empty folders in a given directory.


# examples around functions like .count, .length, .size, .length, .getenumerator, .gettype, .gethashcode



