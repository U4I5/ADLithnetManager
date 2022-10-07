#Coded by U4I5 and Yurisu

#Set the correct current location
$location = Split-Path $MyInvocation.MyCommand.Path -Parent
Set-Location -Path $location

#Import module 
Import-Module LithnetPasswordProtection

#Set your Database Lithnet :
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
    Write-Host $Title  -ForegroundColor Yellow 
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
