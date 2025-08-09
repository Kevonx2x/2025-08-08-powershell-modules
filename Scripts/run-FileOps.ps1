# Import your custom module
Import-Module "C:\Users\turon\OneDrive\Desktop\Powershell_Master\Projects\2025-08-08-powershell-modules\Modules\FileOps.psm1" -Force

# Run the Rename-LogFiles function
Rename-LogFiles -Path "C:\Users\turon\OneDrive\Desktop\Powershell_Master\Projects\2025-08-08-powershell-modules\Logs" -Verbose

# Run the Backup-ConfigFiles function
Backup-ConfigFiles -Source "C:\Users\turon\OneDrive\Desktop\Powershell_Master\Projects\2025-08-08-powershell-modules\Config" `
                   -Destination "C:\Users\turon\OneDrive\Desktop\Powershell_Master\Projects\2025-08-08-powershell-modules\Backups" `
                   -Verbose
