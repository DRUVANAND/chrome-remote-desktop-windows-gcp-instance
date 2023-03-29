resource "google_compute_instance" "chrome_desktop" {
  name         = "automate-windows-chrome-remote-desktop"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "projects/windows-cloud/global/images/windows-server-2022-datacenter-v20220322"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Optional. External IP address configuration.
    }
  }

  metadata_startup_script = file("startup-script.ps1")
  metadata = {
    enable-remoting = "true"
  }
  allow_stopping_for_update = true
  tags                      = ["automate-windows-chrome-remote-desktop"]
}

resource "google_compute_firewall" "chrome_desktop" {
  name    = "chrome-desktop"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
}
