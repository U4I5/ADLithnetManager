# Display instruction to close the current option
Write-Host "`n Press Ctrl+C to close the current option...`n`n" -ForegroundColor Yellow

# Get the selected option contained in the temporary txt file
$selection = Get-Content .\selection.txt
# Delete the temporary txt file
Remove-Item .\selection.txt

# Absolute path of the banned words log file
$location = Split-Path $MyInvocation.MyCommand.Path -Parent
$log_path = "$location\log.txt"

# Switch function used to select option
switch ($selection)
{
    '1'
    {
        # While loop to stay in the selected option
        While ($True) {

            $pass = Read-Host "`n Type Banned Word to add "
            # Define a variable for check result
            $already_banned = 'False'
            # Chek log file if the word to ban has already been added
            foreach ($line in (Get-Content $log_path)) {
                if ($line -like $pass + ';*') {
                    $already_banned = 'True'
                    Write-Host "`n This word is already banned`n" -ForegroundColor Red
                }
            }
            # Log the new Banned Word if the word is not already banned
            if ($already_banned -like 'False') {
                $log_date = Get-Date -Format "dd-MM-yyyy"
                "{0};{1}" -f $pass,$log_date | add-content -path $log_path
                # Lithnet functiun to add a Banned Word
                Add-BannedWord -Value $pass
            }

        }
    }
    '2'
    {
        # While loop to stay in the selected option
        While ($True) {

            $pass = Read-Host " Type word to test "
            # Lithnet functiun to test if a word is banned
            $returnbool = Test-IsBannedWord  -Value $pass
            # If.. Else to display result to the user
            if ($returnbool -eq 'True') {
                Write-Host "`n This word is banned`n" -ForegroundColor Red
            }
            else {
                Write-Host "`n This word is not banned`n" -ForegroundColor Green
            }

        }
    }
    '3'
    {
        # While loop to stay in the selected option
        While ($True) {

            $pass = Read-Host " Type password to test "
            # Lithnet functiun to test if a password is compromised
            $returnbool = Test-IsCompromisedPassword -Value $pass
            # If.. Else to display result to the user
            if ($returnbool -eq 'True') {
                Write-Host " This password is compromised" -ForegroundColor Red
            }
            else {
                Write-Host " This password is authorized" -ForegroundColor Green
            }

        }
    }
    '4'
    {
        # While loop to stay in the selected option
        While ($True) {

            $pass = Read-Host " Type Banned Word to remove "
            # Lithnet function to remove just one Banned Word
            Remove-BannedWord -Value $pass
            # Chek log file to find Banned Word and delete it
            $log_file = foreach ($line in (Get-Content $log_path))
            {
                # If match the banned word -> replace the line into nothing
                if ($line -like $pass + ';*') {}
                else {$line}
            }
            # Set changes to the log file
            $log_file | Set-Content $log_path

        }
    }
    '5'
    {
        # While loop to stay in the selected option
        While ($True) {

            $pass = Read-Host " Type Compromised Password to remove "
            # Lithnet function to remove a Compromised Password
            Remove-CompromisedPassword -Value $pass

        }
    }
    '6'
    {
        # While loop to stay in the selected option
        While ($True) {

            $path = Read-Host " Paste the absolute path of your '.txt' File "
            # Get wordlist.txt as list readable by powershell
            $wordlist = Get-Content -Path $path
            # Foreach loop to select line by line password in Wordlist
            foreach ($word in $wordlist) {
                # Lithnet function to remove Banned Words stored in database
                Remove-CompromisedPassword -Value $word
            }

        }
    }
    '7'
    {
        # While loop to stay in the selected option
        While ($True) {

            $path = Read-Host " Paste the absolute path of your '.txt' file"
            # Get wordlist.txt as list readable by powershell
            $wordlist = Get-Content -Path $path
            # Foreach loop to select line by line password in Wordlist
            foreach ($pass in $wordlist) {
                # Lithnet function to remove Compromised Passwords stored in database
                Remove-CompromisedPassword -Value $pass
            }

        }
    }
    '8'
    {
        # While loop to stay in the selected option
        While ($True) {

            $pathfile = Read-Host " Paste the absolute path of your '.txt' file"
            # Lithnet function to import Banned Words in database
            Import-BannedWords -Filename "$pathfile"

        }
    }
    '9'
    { 
        # While loop to stay in the selected option
        While ($True) {
            
            $pathfile = Read-Host " Paste the absolute path of your '.txt' file"
            # Lithnet function to import Compromised Passwords in database
            Import-CompromisedPasswords -Filename "$pathfile"

        }
    }
    '10'
    { 
        # While loop to stay in the selected option
        While ($True) {

            $pathfile = Read-Host " Paste the absolute path of your '.txt' file"
            # Lithnet function to import Compromised Passwords Hashes in database
            Import-CompromisedPasswordHashes -Filename "$pathfile"

        }
    }
    'L'
    {
        # While loop to stay in the selected option
        While ($True) {

            Clear-Host
            # Message to indicate how to close the option and more information
            Write-Host
            Write-Host " Press Ctrl+C to close the current option..." -ForegroundColor Yellow
            Write-Host
            Write-Host " Press 'Enter' if you want to refresh the log content" -ForegroundColor DarkCyan
            Write-Host
            # Import the log file in csv format
            Import-Csv -Path $log_path -Delimiter ";" | Format-Table
            # Permit the user to press Enter to refresh the log content
            Read-Host

        }  
    }
}
# While loop to stay in the script if an error occurs
while ($True) {}