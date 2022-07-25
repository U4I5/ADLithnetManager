#Coded by U4I5 alias Uriel

#import module 
Import-Module LithnetPasswordProtection

#Set your Database Lithnet
Open-Store -Path "D:\password-protection\test-store"

# Menu Function
function Show-Menu {
    param (
        [string]$Title = 'ADLithnetManager'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "[+]: Taper '1' Pour Mot à Bannir."
    Write-Host "[+]: Taper '2' Pour Tester Un Mot Banni."
    Write-Host "[+]: Taper '3' Pour Retirer Un Mot Banni."
    Write-Host "[+]: Taper '4' Pour Importer Une Liste de mots Banni."
    Write-Host "[+]: Taper '5' Pour Tester des Mots de Passe Compromis."
    Write-Host "[+]: Taper '6' Pour Importer Une Liste de Mots de Passe Compromis."
    Write-Host "[+]: Taper '7' Pour Importer Une Liste de Mots de Passe hashés NTLM Compromis."
    Write-Host "[+]: Taper 'Q' Pour quitter."

}
# Loop for interactive with Menu
do
 {
    Show-Menu
    $selection = Read-Host "Choisir Une Option"
    switch ($selection)
    {
    '1' {
        $msg1 = 'Taper Le Mot'
        $pass = Read-Host -Prompt $msg1
        Add-BannedWord -Value $pass

    } '2' {

        $msg2 = 'Taper Le Mot'
        $pass = Read-Host -Prompt $msg2
        $retrunbool = Test-IsBannedWord  -Value $pass
        if ($retrunbool -eq 'True'){
            
             Write-Host "Ce Mot Est Banni"
        }else {
            Write-Host "Ce Mot Est Autorisé"
        }
        
    } '3' {
        
        $msg3 = 'Taper le Mot à Retirer'
        $pass = Read-Host -Prompt $msg3
        Remove-BannedWord -Value $pass

    } '4' {

        $msg4 = 'Coller le Lien Du fichier .txt'
        $pathfile= Read-Host -Prompt $msg4
        Import-BannedWords -Filename "$pathfile"

    }'5'{ 

        $msg5 = 'Taper Le Mot de Passe'
        $pass = Read-Host -Prompt $msg5
        $retrunbool = Test-IsCompromisedPassword -Value $pass
        if ($retrunbool -eq 'True'){
            
             Write-Host "Ce Mot de Passe Est Banni"
        }else {
            Write-Host "Ce Mot de Passe Est Autorisé"
        }
        
    }'6'{ 

        $msg6 = 'Coller le Lien Du fichier ".txt" Format Hashé'
        $pathfile2 = Read-Host -Prompt $msg6
        Import-CompromisedPasswords -Filename "$pathfile2"

    }'7'{ 

    $msg7 = 'Coller le Lien Du fichier .txt'
    $pathfile3 = Read-Host -Prompt $msg7
    Import-CompromisedPasswordHashes -Filename "$pathfile3"
    
    }

    }
    pause
 }
 until ($selection -eq 'q')


