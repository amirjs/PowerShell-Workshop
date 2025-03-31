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


<#
🧪 Challenge 1: Age Check Script
Task: Prompt the user for their age and print a message based on the value. Hint: use read-host

🧪 Challenge 2: File Existence Check
Task: Check if a file exists and display an appropriate message.

#>