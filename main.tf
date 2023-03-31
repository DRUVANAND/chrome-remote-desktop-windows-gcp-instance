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
 scheduling {
    # Only run from Monday to Thursday and Saturday
    weekly_schedule {
      day_of_week = 1 # Monday
      start_time  = "00:00"
      duration    = "24h"
    }
    weekly_schedule {
      day_of_week = 2 # Tuesday
      start_time  = "00:00"
      duration    = "24h"
    }
    weekly_schedule {
      day_of_week = 3 # Wednesday
      start_time  = "00:00"
      duration    = "24h"
    }
    weekly_schedule {
      day_of_week = 4 # Thursday
      start_time  = "00:00"
      duration    = "24h"
    }
    weekly_schedule {
      day_of_week = 5 # Friday
      start_time  = "00:00"
      duration    = "24h"
      exclude {
        recurrence {
          start_time = "13:50"
          end_time   = "14:00"
        }
    }

    # Exclude Saturday and Sunday
    exclude {
      day_of_week = 6 # Saturday
      start_time  = "00:00"
      duration    = "24h"
    } 
    exclude {
      day_of_week = 0 # Sunday
      start_time  = "00:00"
      duration    = "24h"
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

