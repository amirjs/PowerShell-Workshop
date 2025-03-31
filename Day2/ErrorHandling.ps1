<#
🔸 Part 2: Error Handling – try, catch, finally
✅ Concept
Use error handling to gracefully manage and respond to unexpected errors.


🔹 Example 1: Divide by zero
#>
try {
    $result = 10 / 0
}
catch {
    Write-Host "Oops! You can't divide by zero."
}

#🔹 Example 2: File not found


try {
    Get-Content -Path "C:\nonexistent.txt" -ErrorAction Stop
}
catch {
    Write-Warning "File not found: $_"
}


🧪 Challenge 1: Safe File Reader
Task: Prompt for a file path, and use try/catch to handle errors when reading it.

powershell
Copy
Edit
$file = Read-Host "Enter the path to a file"

try {
    $content = Get-Content -Path $file -ErrorAction Stop
    Write-Output "File Contents:"
    Write-Output $content
}
catch {
    Write-Warning "An error occurred while reading the file: $_"
}
🧪 Challenge 2: Safe Division Script
Task: Prompt the user for two numbers and safely divide them.

powershell
Copy
Edit
$num1 = Read-Host "Enter numerator"
$num2 = Read-Host "Enter denominator"

try {
    $result = [int]$num1 / [int]$num2
    Write-Output "Result: $result"
}
catch {
    Write-Host "Division failed: $_"
}
🔸 Part 3: Looping
🔹 foreach Loop
Loop through items in a collection.

powershell
Copy
Edit
$names = @("Alice", "Bob", "Charlie")

foreach ($name in $names) {
    Write-Host "Hello, $name!"
}
