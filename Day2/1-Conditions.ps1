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

🧪 Challenge 1: Age Check Script
Task: Prompt the user for their age and print a message based on the value.

powershell
Copy
Edit
$age = Read-Host "Enter your age"

if ($age -lt 18) {
    Write-Output "You're under 18."
} elseif ($age -ge 18 -and $age -lt 65) {
    Write-Output "You're an adult."
} else {
    Write-Output "You're a senior citizen."
}


🧪 Challenge 2: File Existence Check
Task: Check if a file exists and display an appropriate message.

powershell
Copy
Edit
$file = Read-Host "Enter full path to the file"

if (Test-Path $file) {
    Write-Output "File found: $file"
} else {
    Write-Output "File not found."
}

🔸 Part 2: Error Handling – try, catch, finally
✅ Concept
Use error handling to gracefully manage and respond to unexpected errors.

🔹 Syntax
powershell
Copy
Edit
try {
    # code that may error
}
catch {
    # what to do if an error occurs
}
finally {
    # optional, always runs
}
🔹 Example 1: Divide by zero
powershell
Copy
Edit
try {
    $result = 10 / 0
}
catch {
    Write-Host "Oops! You can't divide by zero."
}
🔹 Example 2: File not found
powershell
Copy
Edit
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
🔹 for Loop
Loop a known number of times.

powershell
Copy
Edit
for ($i = 1; $i -le 5; $i++) {
    Write-Host "Looping $i"
}
🔹 while Loop
Continue while a condition is true.

powershell
Copy
Edit
$count = 1

while ($count -le 3) {
    Write-Host "Count is $count"
    $count++
}
🔹 do-while and do-until Loops
powershell
Copy
Edit
# do-while
$count = 1
do {
    Write-Host "do-while: $count"
    $count++
} while ($count -le 3)

# do-until
$count = 1
do {
    Write-Host "do-until: $count"
    $count++
} until ($count -gt 3)
🧪 Challenge 1: Loop Through Files
Task: Create an array of file names and check if each one exists using a foreach loop.

powershell
Copy
Edit
$files = @("C:\file1.txt", "C:\file2.txt", "C:\file3.txt")

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "$file exists."
    } else {
        Write-Host "$file is missing."
    }
}
🧪 Challenge 2: Countdown with for
Task: Count down from 10 to 1 using a for loop.

powershell
Copy
Edit
for ($i = 10; $i -ge 1; $i--) {
    Write-Host "Countdown: $i"
}
🧪 Challenge 3: User Input Loop
Task: Keep prompting the user until they type "exit" using a while loop.

powershell
Copy
Edit
do {
    $input = Read-Host "Type something (or type 'exit' to quit)"
    Write-Host "You typed: $input"
} while ($input -ne "exit")