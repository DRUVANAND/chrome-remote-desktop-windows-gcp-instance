# Download and install the Chrome Remote Desktop Host
(new-object System.Net.WebClient).DownloadFile('https://chrome-remote-desktop.software.informer.com/download/?ca2feb6f', 'C:/chromeremotedesktophost.msi')
Start-Process 'msiexec.exe' -Wait -ArgumentList '/i C:/chromeremotedesktophost.msi /quiet /qn /norestart'
Remove-Item C:/chromeremotedesktophost.msi -Force
