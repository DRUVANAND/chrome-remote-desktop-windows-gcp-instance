/*resource "google_compute_instance" "chrome-remote-desktop" {
  name         = "chrome-remote-desktop"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019"
    }
  }

  network_interface {
    network = "default"

  access_config {
    }
  }
  # Install Chrome Remote Desktop Host on startup
 metadata_startup_script = <<-EOF
    $installer = "$env:TEMP\\chromeremotedesktophost.msi"
    $uri = 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi'
    (New-Object Net.WebClient).DownloadFile($uri, $installer)
    Start-Process $installer -Wait
    Remove-Item $installer
  EOF
  tags = ["chrome-remote-desktop"]
}

resource "google_compute_firewall" "chrome_desktop" {
  name    = "chrome-desktop"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["443","3389","22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
*/
