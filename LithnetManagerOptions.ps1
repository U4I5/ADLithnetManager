<<<<<<< HEAD
﻿#Message to indicate how to close the option
Write-Host
Write-Host "Press Ctrl+C to close the current option..." -ForegroundColor Yellow
Write-Host
Write-Host

#Gets the selected option in the temporary text file
$selection = Get-Content .\selection.txt
#Deletes the temporary text file
Remove-Item .\selection.txt

#Absolute path of the log file of banned words added
$log_path = "C:\Users\ul.oberlin\Documents\Travail\test.txt"

=======
﻿#Message to indicate how to close the option
Write-Host
Write-Host "Appuyez sur Ctrl+C pour fermer l'option" -ForegroundColor Yellow
Write-Host
Write-Host

#Get the selected option in the temporary text file
$selection = Get-Content .\selection.txt
#Delete the temporary text file
Remove-Item .\selection.txt

>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
#Switch function used to select option
switch ($selection)
{
    '1'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable message
<<<<<<< HEAD
            $msg1 = 'Type Word To Ban'
            Write-Host
            $pass = Read-Host -Prompt $msg1
            #Sets variable as false as default
            $already_banned = 'False'
            #Cheks log file if the word to ban has been already added
            foreach ($line in (Get-Content $log_path)) {
                #Checks match with the banned words log file
                if ($line -like $pass + ';*') {
                    $already_banned = 'True'
                    Write-Host
                    Write-Host "This word is already banned" -ForegroundColor Red
                    Write-Host
                }
            }
            #Checks if the word is not already banned
            if ($already_banned -like 'False') {
                #Gets date for log
                $log_date = Get-Date -Format "dd-MM-yyyy"
                #Adds a new line in the log file
                "{0};{1}" -f $pass,$log_date | add-content -path $log_path
                #Lithnet functiun to add just one Banned Word
                Add-BannedWord -Value $pass
            }
        }
        until ('a' -ne 'a')

    }
    '2'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable message
            $msg2 = 'Type Word To Test'
=======
            $msg1 = 'Taper Le Mot'
            $pass = Read-Host -Prompt $msg1
            #Lithnet functiun to add just one Banned Word
            Add-BannedWord -Value $pass
        }
        until ($impossible -eq 'possible')

    }
    '2'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable message
            $msg2 = 'Taper Le Mot à Tester'
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $pass = Read-Host -Prompt $msg2
            #Lithnet functiun to test if a Word is Banned
            $returnbool = Test-IsBannedWord  -Value $pass
            if ($returnbool -eq 'True') {
<<<<<<< HEAD
                Write-Host "This Word Is Banned" -ForegroundColor Red
                Write-Host
            }
            else {
                Write-Host "This Word Is Not Banned" -ForegroundColor Green
                Write-Host
            }
        }
        until ('a' -ne 'a')
=======
                Write-Host "Ce Mot Est Banni" -ForegroundColor Red
                Write-Host
            }
            else {
                Write-Host "Ce Mot Est Autorisé" -ForegroundColor Green
                Write-Host
            }
        }
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '3'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable message
<<<<<<< HEAD
            $msg3 = 'Type Password To Test'
=======
            $msg3 = 'Taper Le Mot de Passe à Tester'
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $pass = Read-Host -Prompt $msg3
            #Lithnet functiun to test if a Password is Compromised
            $returnbool = Test-IsCompromisedPassword -Value $pass
            if ($returnbool -eq 'True') {
<<<<<<< HEAD
                Write-Host "This Password Is Compromised." -ForegroundColor Red 
            }
            else {
                Write-Host "This Password Is Authorized" -ForegroundColor Green 
            }
        }
        until ('a' -ne 'a')
=======
                Write-Host "Ce Mot de Passe Est Compromis." -ForegroundColor Red 
            }
            else {
                Write-Host "Ce Mot de Passe Est Autorisé" -ForegroundColor Green 
            }
        }
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '4'
    {
<<<<<<< HEAD
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg4 = 'Type Banned Word To Remove'
            #Variable of the Bannedword
            $pass = Read-Host -Prompt $msg4
            #Lithnet function to remove just one Banned Word
            Remove-BannedWord -Value $pass
            #Gets content of the log file line per line
            $log_file = foreach ($line in (Get-Content $log_path))
            {
                #Checks match with the banned word and replaces the line to nothing
                if ($line -like $pass + ';*') {}
                else {$line}
            }
            #Sets mofications into the log file
            $log_file | Set-Content $log_path
        }
        until ('a' -ne 'a')
=======
        
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #variable Message
            $msg4 = 'Taper le Mot Banni à Retirer'
            #variable of  the Bannedword
            $pass = Read-Host -Prompt $msg4
            #Lithnet function to remove just one Banned Word
            Remove-BannedWord -Value $pass
        }
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '5'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
<<<<<<< HEAD
            $msg5 = 'Type Compromised Password To Remove'
            #Variable of User password's 
=======
            $msg5 = 'Taper le Mot de Passe Compromis à Retirer'
            #Variable of  User password's 
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $pass = Read-Host -Prompt $msg5
            #Lithnet function to remove just one Compromised Password
            Remove-CompromisedPassword -Value $pass
        }
<<<<<<< HEAD
        until ('a' -ne 'a')
=======
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '6'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
<<<<<<< HEAD
            $msg6 =  'Paste The Absolute Path Of Your ".txt" File'
            #Variable path of wordlist content password
=======
            $msg6 =  'Coller le Lien Du fichier ".txt"'
            #Variable path  of wordlist content password
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $path = Read-Host -Prompt $msg6
            #Get wordlist.txt as list readable by powershell
            $wordlist = Get-Content -Path $path
            #Loop Foreach to select line by line password in Wordlist
            foreach ($word in $wordlist) {
                #Lithnet function to remove Banned Words stored in database
                Remove-CompromisedPassword -Value $word
            }
        }
<<<<<<< HEAD
        until ('a' -ne 'a')
=======
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '7'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
<<<<<<< HEAD
            $msg7 = 'Paste The Absolute Path Of Your ".txt" File'
            #Variable path of wordlist content password
            $path = Read-Host -Prompt $msg7
            #Gets wordlist.txt as list readable by powershell
=======
            $msg7 = 'Coller le Lien Du fichier ".txt"'
            #Variable path of wordlist content password
            $path = Read-Host -Prompt $msg7
            #Get wordlist.txt as list readable by powershell
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $wordlist = Get-Content -Path $path
            #Loop Foreach to select line by line password in Wordlist
            foreach ($pass in $wordlist) {
                #Lithnet function to remove Compromised Passwords stored in database
                Remove-CompromisedPassword -Value $pass
            }
        }
<<<<<<< HEAD
        until ('a' -ne 'a')
=======
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '8'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
<<<<<<< HEAD
            $msg8 = 'Paste The Absolute Path Of Your ".txt" File'
=======
            $msg8 = 'Coller le Lien Du fichier ".txt"'
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $pathfile = Read-Host -Prompt $msg8
            #Lithnet function to import Banned Words in database
            Import-BannedWords -Filename "$pathfile"
        }
<<<<<<< HEAD
        until ('a' -ne 'a')
=======
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '9'
    { 
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
<<<<<<< HEAD
            $msg9 = 'Paste The Absolute Path Of Your ".txt" File'
=======
            $msg9 = 'Coller le Lien Du fichier .txt'
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $pathfile2 = Read-Host -Prompt $msg9
            #Lithnet function to import Compromised Passwords in database
            Import-CompromisedPasswords -Filename "$pathfile2"
        }
<<<<<<< HEAD
        until ('a' -ne 'a')
=======
        until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d

    }
    '10'
    { 
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
<<<<<<< HEAD
            $msg10 = 'Paste The Absolute Path Of Your ".txt" File'
=======
            $msg10 = 'Coller le Lien Du fichier ".txt" au Format Hashé'
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
            $pathfile3 = Read-Host -Prompt $msg10
            #Lithnet function to import Compromised Passwords Hashes in database
            Import-CompromisedPasswordHashes -Filename "$pathfile3"
        }
<<<<<<< HEAD
        until ('a' -ne 'a')

    }
    'L'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            Clear-Host
            #Message to indicate how to close the option and more information
            Write-Host
            Write-Host "Press Ctrl+C to close the current option..." -ForegroundColor Yellow
            Write-Host
            Write-Host "Press 'Enter' if you want to refresh the log content" -ForegroundColor DarkCyan
            Write-Host
            #Imports the log file in csv format
            Import-Csv -Path $log_path -Delimiter ";" | Format-Table
            #Permits to press Enter to refresh the log content
            Read-Host
        }
        until ('a' -ne 'a')
        
    }
=======
        until ($impossible -eq 'possible')

    }

>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
}