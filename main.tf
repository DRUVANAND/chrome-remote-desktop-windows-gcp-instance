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

  # Set up the Chrome Remote Desktop extension on the instance
  metadata = {
    enable-remoting= "true"
  }

  # Allow RDP traffic to the instance
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}
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
