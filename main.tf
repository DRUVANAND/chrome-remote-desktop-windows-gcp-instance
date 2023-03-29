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
  }

  metadata_startup_script = "${file("chrome-remote-desktop.ps1")}"

  metadata = {
    windows-startup-script-ps1 = "${file("install-chrome-remote-desktop.ps1")}"
  }

  tags = ["chrome-remote-desktop"]
}

resource "google_compute_firewall" "chrome-remote-desktop" {
  name    = "allow-chrome-remote-desktop"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3389", "22", "5222", "8889"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  target_tags   = ["chrome-remote-desktop"]
}
*/
