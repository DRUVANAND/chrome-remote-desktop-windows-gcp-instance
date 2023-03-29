# Set execution policy for PowerShell
Set-ExecutionPolicy RemoteSigned -force

# Wait for 60 seconds to allow metadata server to fetch install script
Start-Sleep -Seconds 60

# Run the install script
C:\install-chrome-remote-desktop.ps1
