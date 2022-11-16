#Coded by U4I5 and Yurisu

<<<<<<< HEAD
#Sets the correct current location
$location = Split-Path $MyInvocation.MyCommand.Path -Parent
Set-Location -Path $location

#Imports module 
=======
#Set the correct current location
$location = Split-Path $MyInvocation.MyCommand.Path -Parent
Set-Location -Path $location

#Import module 
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
Import-Module LithnetPasswordProtection

#Set your Database Lithnet :
#Open-Store -Path "D:\password-protection\test-store"

#Menu Function
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
    Write-Host $Title  -ForegroundColor Yellow 
<<<<<<< HEAD
    Write-Host "[+]: Type '1' To Add A Banned Word." -ForegroundColor DarkGreen
    Write-Host "[+]: Type '2' To Test A banned Word."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '3' To Test A Compromised Password."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '4' To Remove A Banned Word." -ForegroundColor DarkGreen
    Write-Host "[+]: Type '5' To Remove A Compromised Password."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '6' To Remove A List Of Banned Words."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '7' To Remove A List Of Compromised Passwords."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '8' To Import A List Of Banned Words."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '9' To Import A List Of Compromised Passwords."  -ForegroundColor DarkGreen
    Write-Host "[+]: Type '10' To Import A List Of Compromised Password NTLM Hashes."  -ForegroundColor DarkGreen
    Write-Host
    Write-Host "[+]: Type 'L' To Print Logs Of Banned Words Added" -ForegroundColor DarkCyan
    Write-Host "[+]: Type 'Q' To Quit." -ForegroundColor Red
    Write-Host

}
#Infinite loop to interact with Menu
do {
    #Prints the menu and ask an option to display
    Show-Menu
    $selection = Read-Host "Select An Option"

    #Checks if "Q" is selected to exit or continue to the option selection
    if ($selection -eq 'q') {exit}
    else {
        #Sets the content of the $selection variable in a temporary text file
        Set-Content .\selection.txt $selection
        #Opens the selected option in a new powershell window
        Start-Process powershell {powershell.exe -file '.\LithnetManagerOptions.ps1'}
    }
}
until ('a' -ne 'a')
=======
    Write-Host "[+]: Taper '1' Pour Mot A Bannir." -ForegroundColor Green
    Write-Host "[+]: Taper '2' Pour Tester Un Mot Banni."  -ForegroundColor Green
    Write-Host "[+]: Taper '3' Pour Tester Un Mot de Passe Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper '4' Pour Retirer Un Mot Banni." -ForegroundColor Green
    Write-Host "[+]: Taper '5' Pour Retirer Un Mot Passe Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper '6' Pour Retirer Une Liste de mots Bannis."  -ForegroundColor Green
    Write-Host "[+]: Taper '7' Pour Retirer Une Liste de Mots de Passe Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper '8' Pour Importer Une Liste de mots Bannis."  -ForegroundColor Green
    Write-Host "[+]: Taper '9' Pour Importer Une Liste de Mots de Passe Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper '10' Pour Importer Une Liste de Mots de Passe Hashés NTLM Compromis."  -ForegroundColor Green
    Write-Host "[+]: Taper 'Q' Pour quitter." -ForegroundColor Red
    Write-Host

}
#Loop for interactive with Menu
do {
    #Print the menu and ask an option to display
    Show-Menu
    $selection = Read-Host "Choisir Une Option"

    #Check if "Q" is selected to exit or continue to an option
    if ($selection -eq 'q') {exit}
    else {
        #Set the content of the $selection variable in a temporary text file
        Set-Content .\selection.txt $selection
        #Open the selected option in a new powershell window
        Start powershell {powershell.exe -file '.\LithnetManagerOptions.ps1'}
    }
}
until ($impossible -eq 'possible')
>>>>>>> f87f19326409943d745d9844ffc25d2943990e7d
