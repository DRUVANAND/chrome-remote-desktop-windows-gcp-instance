resource "google_compute_instance" "chrome_desktop" {
  name         = "automate-windows-chrome-remote-desktop"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20230315"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Optional. External IP address configuration.
    }
  }

 metadata_startup_script = "powershell.exe Set-ExecutionPolicy RemoteSigned -force; (new-object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome-remote-desktop/chromeremotedesktophost.msi', 'C:/chromeremotedesktophost.msi'); Start-Process 'msiexec.exe' -Wait -ArgumentList '/i C:/chromeremotedesktophost.msi /quiet /qn /norestart'; Remove-Item C:/chromeremotedesktophost.msi -Force"

 tags = ["chrome-remote-desktop"]
}


resource "google_compute_firewall" "chrome_desktop" {
  name    = "chrome-desktop"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["443","3389"]
  }
  source_ranges = ["0.0.0.0/0"]
}

