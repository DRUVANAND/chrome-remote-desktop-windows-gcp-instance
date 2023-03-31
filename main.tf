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

  resource_policies = [google_compute_resource_policy.hourly.self_link]

}

resource "google_compute_firewall" "chrome_desktop" {
  name    = "chrome-desktop"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["443", "3389", "22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_resource_policy" "hourly" {
  name        = "gce-policy"
  region      = "us-central1"
  description = "Start and stop instances"

    instance_schedule_policy {
    vm_start_schedule {
      schedule = "15 22 * * 5"
    }
    vm_stop_schedule {
      schedule = "08 22 * * 5"
    }

    time_zone = "Asia/Kolkata"
    
  }
}

