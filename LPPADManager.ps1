#Coded by U4I5 and Yurisu

#Sets the correct current location
$location = Split-Path $MyInvocation.MyCommand.Path -Parent
Set-Location -Path $location

#Imports module 
Import-Module LithnetPasswordProtection

#Set your Database Lithnet :
#Open-Store -Path "D:\password-protection\test-store"

#Menu Function
function Show-Menu {
    param (
        [string]$Title = @"
    -------------------------------------------------------------------------
     __    ____  ____  _____ ____  _____
    |  |  |  _  \  _  \  _  |    \|     |___ ___ ___ ___ ___ ___
    |  |__|   __/   __/     |  |  | | | | .'|   | .'| . | -_|  _|
    |_____|__|  |__|  |__|__|____/|_|_|_|__,|_|_|__,|_  |___|_|
                                                    |___|
    -------------------------------------------------------------------------


"@
    )
    Clear-Host
    Write-Host $Title  -ForegroundColor DarkCyan
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
    Write-Host "[+]: Type 'L' To Print Logs Of Banned Words Added" -ForegroundColor DarkYellow
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