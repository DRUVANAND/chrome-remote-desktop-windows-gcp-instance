  $installer = "$env:TEMP\chromeremotedesktophost.msi"
  $uri = 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi'
  (New-Object Net.WebClient).DownloadFile($uri,"$installer") 
    Start-Process $installer -Wait 
    Remove-Item $installer
