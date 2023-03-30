# Download and install the Chrome Remote Desktop Host
(new-object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome-remote-desktop/current/chrome-remote-desktop-host.msi', 'C:/chromeremotedesktophost.msi')
Start-Process 'msiexec.exe' -Wait -ArgumentList '/i C:/chromeremotedesktophost.msi /quiet /qn /norestart'
Remove-Item C:/chromeremotedesktophost.msi -Force
