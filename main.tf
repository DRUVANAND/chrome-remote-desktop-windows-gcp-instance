resource "google_compute_instance" "chrome-remote-desktop" {
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
 metadata = {
    windows-startup-script-ps1 = file("startup-script.ps1")
 }
 schedule_policy {
    start_time = "08:00"
    end_time = "17:00"
    recurrence {
      weekday = [1, 2, 3, 4, 5]
    }
  }
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

