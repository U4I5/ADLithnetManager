#Coded by U4I5 alias Uriel

#import module 
Import-Module LithnetPasswordProtection

#Set your Database Lithnet
#Open-Store -Path "D:\password-protection\test-store"

# Menu Function
function Show-Menu {
    param (
        [string]$Title = @"          
    -------------------------------------------------------------------------                                                          
    _____ ____  __    _ _   _           _   _____                          
    |  _  |    \|  |  |_| |_| |_ ___ ___| |_|     |___ ___ ___ ___ ___ ___  
    |     |  |  |  |__| |  _|   |   | -_|  _| | | | .'|   | .'| . | -_|  _| 
    |__|__|____/|_____|_|_| |_|_|_|_|___|_| |_|_|_|__,|_|_|__,|_  |___|_|   
                                                          |___|         
    -------------------------------------------------------------------------                                                                                                                                                                                                                                                                                         
"@
    )
    Clear-Host
    Write-Host $Title  -ForegroundColor yellow 
    Write-Host "[+]: Taper '1' Pour Mot A Bannir." -ForegroundColor Green
    Write-Host "[+]: Taper '2' Pour Tester Un Mot Banni."  -ForegroundColor Green
    Write-Host "[+]: Taper '3' Pour Tester Un Mot de Passe Compromi."  -ForegroundColor Green
    Write-Host "[+]: Taper '4' Pour Retirer Un Mot Banni." -ForegroundColor Green
    Write-Host "[+]: Taper '5' Pour Retirer Un Mot Passe Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper '6' Pour Importer Une Liste de mots Bannis."  -ForegroundColor Green
    Write-Host "[+]: Taper '7' Pour Importer Une Liste de Mots de Passe Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper '8' Pour Importer Une Liste de Mots de Passe Hashés NTLM Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper 'Q' Pour quitter." -ForegroundColor Red
    Write-Host

}
# Loop for interactive with Menu
do
 {
    Show-Menu
    $selection = Read-Host "Choisir Une Option" 
 
    switch ($selection)
    {
     '1'{
        $msg1 = 'Taper Le Mot'
        $pass = Read-Host -Prompt $msg1
        Add-BannedWord -Value $pass

    }'2'{

        $msg2 = 'Taper Le Mot'
        $pass = Read-Host -Prompt $msg2
        $retrunbool = Test-IsBannedWord  -Value $pass
        if ($retrunbool -eq 'True'){
            
            Write-Host "Ce Mot Est Banni" -ForegroundColor Red 
            Write-Host
        }else {
            Write-Host "Ce Mot Est Autorisé" -ForegroundColor Green 
            Write-Host
        }
        
    }'3'{ 

        $msg3 = 'Taper Le Mot de Passe'
        $pass = Read-Host -Prompt $msg3
        $retrunbool = Test-IsCompromisedPassword -Value $pass
        if ($retrunbool -eq 'True'){
            
             Write-Host "Ce Mot de Passe Est Compromis." -ForegroundColor Red 
        }else {
            Write-Host "Ce Mot de Passe Est Autorisé" -ForegroundColor Green 
        }

    }'4'{
        
        $msg4 = 'Taper le Mot a Retirer'
        $pass = Read-Host -Prompt $msg4
        Remove-BannedWord -Value $pass

    }'5'{
        
        $msg5 = 'Taper le Mot de Passe Compromis à Retirer'
        $pass = Read-Host -Prompt $msg5
        Remove-CompromisedPassword -Value $pass

    }'6'{

        $msg6 = 'Coller le Lien Du fichier ".txt"'
        $pathfile= Read-Host -Prompt $msg6
        Import-BannedWords -Filename "$pathfile"

  
        
    }'7'{ 

        $msg7 = 'Coller le Lien Du fichier .txt'
        $pathfile2 = Read-Host -Prompt $msg7
        Import-CompromisedPasswords -Filename "$pathfile2"

    }'8'{ 

    $msg8 = 'Coller le Lien Du fichier ".txt" au Format Hashé'
    $pathfile3 = Read-Host -Prompt $msg8
    Import-CompromisedPasswordHashes -Filename "$pathfile3"
    
    }

    }
    pause
 }
 until ($selection -eq 'q')
