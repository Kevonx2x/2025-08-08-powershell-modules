\# PowerShell Modules – August 8, 2025



\## 🎯 Goal

Create and test reusable PowerShell module functions using `.psm1` and `.ps1` scripts.



\## 📂 Folder Structure



Modules/ 

* FilesOps.psm1



Scripts/

* run-FileOps.ps1



Logs/

* output-log.txt



Examples/

* test-sample.ps1







\## 🔧 Functions Built

\- `Rename-LogFiles`: Renames all `.log` files in a directory with a timestamp suffix.

\- `Backup-ConfigFiles`: Copies config files to a backup folder.



\## 📦 How to Use

```powershell

Import-Module ./Modules/FileOps.psm1

Rename-LogFiles -Path "C:\\Logs"

Backup-ConfigFiles -Source "C:\\Config" -Destination "D:\\Backup"







