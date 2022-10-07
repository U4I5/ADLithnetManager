#Message to indicate how to close the option
Write-Host
Write-Host "Appuyez sur Ctrl+C pour fermer l'option" -ForegroundColor Yellow
Write-Host
Write-Host

#Get the selected option in the temporary text file
$selection = Get-Content .\selection.txt
#Delete the temporary text file
Remove-Item .\selection.txt

#Switch function used to select option
switch ($selection)
{
    '1'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable message
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
            $pass = Read-Host -Prompt $msg2
            #Lithnet functiun to test if a Word is Banned
            $returnbool = Test-IsBannedWord  -Value $pass
            if ($returnbool -eq 'True') {
                Write-Host "Ce Mot Est Banni" -ForegroundColor Red
                Write-Host
            }
            else {
                Write-Host "Ce Mot Est Autorisé" -ForegroundColor Green
                Write-Host
            }
        }
        until ($impossible -eq 'possible')

    }
    '3'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable message
            $msg3 = 'Taper Le Mot de Passe à Tester'
            $pass = Read-Host -Prompt $msg3
            #Lithnet functiun to test if a Password is Compromised
            $returnbool = Test-IsCompromisedPassword -Value $pass
            if ($returnbool -eq 'True') {
                Write-Host "Ce Mot de Passe Est Compromis." -ForegroundColor Red 
            }
            else {
                Write-Host "Ce Mot de Passe Est Autorisé" -ForegroundColor Green 
            }
        }
        until ($impossible -eq 'possible')

    }
    '4'
    {
        
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

    }
    '5'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg5 = 'Taper le Mot de Passe Compromis à Retirer'
            #Variable of  User password's 
            $pass = Read-Host -Prompt $msg5
            #Lithnet function to remove just one Compromised Password
            Remove-CompromisedPassword -Value $pass
        }
        until ($impossible -eq 'possible')

    }
    '6'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg6 =  'Coller le Lien Du fichier ".txt"'
            #Variable path  of wordlist content password
            $path = Read-Host -Prompt $msg6
            #Get wordlist.txt as list readable by powershell
            $wordlist = Get-Content -Path $path
            #Loop Foreach to select line by line password in Wordlist
            foreach ($word in $wordlist) {
                #Lithnet function to remove Banned Words stored in database
                Remove-CompromisedPassword -Value $word
            }
        }
        until ($impossible -eq 'possible')

    }
    '7'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg7 = 'Coller le Lien Du fichier ".txt"'
            #Variable path of wordlist content password
            $path = Read-Host -Prompt $msg7
            #Get wordlist.txt as list readable by powershell
            $wordlist = Get-Content -Path $path
            #Loop Foreach to select line by line password in Wordlist
            foreach ($pass in $wordlist) {
                #Lithnet function to remove Compromised Passwords stored in database
                Remove-CompromisedPassword -Value $pass
            }
        }
        until ($impossible -eq 'possible')

    }
    '8'
    {
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg8 = 'Coller le Lien Du fichier ".txt"'
            $pathfile = Read-Host -Prompt $msg8
            #Lithnet function to import Banned Words in database
            Import-BannedWords -Filename "$pathfile"
        }
        until ($impossible -eq 'possible')

    }
    '9'
    { 
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg9 = 'Coller le Lien Du fichier .txt'
            $pathfile2 = Read-Host -Prompt $msg9
            #Lithnet function to import Compromised Passwords in database
            Import-CompromisedPasswords -Filename "$pathfile2"
        }
        until ($impossible -eq 'possible')

    }
    '10'
    { 
        #Recurrent loop "do.. until" to stay in the option selected
        do {
            #Variable Message
            $msg10 = 'Coller le Lien Du fichier ".txt" au Format Hashé'
            $pathfile3 = Read-Host -Prompt $msg10
            #Lithnet function to import Compromised Passwords Hashes in database
            Import-CompromisedPasswordHashes -Filename "$pathfile3"
        }
        until ($impossible -eq 'possible')

    }

}