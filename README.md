![](https://github.com/U4I5/LPPADManager/blob/main/LPPADManagerScreenshot.png)
## LPPAD Manager
### What is that ?
**L**ithnet **P**assword **P**rotection for **A**ctive **D**irectory **Manager**,\
It is a PowerShell script made for SysAdmins who want to use Lithnet Password Protection more easily !
### What does it allow ?
Most of the Lithnet Password Protection commands are simplified by using them in a row thanks to an option system.\
We have also added a log file wich contains all banned words that you will add.
### Why did you decide to log banned words ?
It's impossible to check the content of stores, and it can be annoying to remember all the banned words you added,\
so we decided to make a log file only for banned words because we think that is the most important feature in LPP.
### How can I make it works on my Domain Controller ?
You simply have to [install](https://github.com/U4I5/LPPADManager/archive/refs/heads/main.zip) our code, and then follow these steps :
* Unzip the LPPADManager directory
* Get into it
* Manually run "LPPADManagerOptions.ps1" for the first time. (Usefull for authorizations)
* Now you can use "LPPADManager.ps1" (main script) !