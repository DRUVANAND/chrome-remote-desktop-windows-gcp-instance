# Download and install the Chrome Remote Desktop Host
(new-object System.Net.WebClient).DownloadFile('https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi', 'C:/chromeremotedesktophost.msi')
Start-Process 'msiexec.exe' -Wait -ArgumentList '/i C:/chromeremotedesktophost.msi /quiet /qn /norestart'
Remove-Item C:/chromeremotedesktophost.msi -Force
