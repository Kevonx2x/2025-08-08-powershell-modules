# PowerShell Module: FileOps.psm1
# 📦 Reusable functions for file renaming and config backups

# This turns your function into a real cmdlet (adds support for -Verbose, -ErrorAction, etc.)
[CmdletBinding()]
function Rename-LogFiles {
    param (
        # This means the user MUST provide this parameter
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    # Check if the provided path exists before doing anything
    if (-Not (Test-Path $Path)) {
        Write-Error "Path does not exist: $Path"
        return
    }

    # Get all .log files in the directory and rename them with a timestamp
    Get-ChildItem -Path $Path -Filter *.log | ForEach-Object {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"  # Format like 20250808_104500
        $newName = "$($_.BaseName)_$timestamp$($_.Extension)"  # OriginalName_20250808_104500.log
        Rename-Item $_.FullName -NewName $newName
    }
}

# This turns your function into a cmdlet too
[CmdletBinding()]
function Backup-ConfigFiles {
    param (
        # Require a source folder
        [Parameter(Mandatory=$true)]
        [string]$Source,

        # Require a destination folder
        [Parameter(Mandatory=$true)]
        [string]$Destination
    )

    # Validate source path exists
    if (-Not (Test-Path $Source)) {
        Write-Error "Source path does not exist: $Source"
        return
    }

    # If the destination path doesn't exist, create it
    if (-Not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination | Out-Null
    }

    # Copy all .config files from source to destination
    Copy-Item "$Source\*.config" -Destination $Destination -Recurse -Force
}
