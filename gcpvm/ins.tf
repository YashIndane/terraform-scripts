resource "google_compute_instance" "ins1" {
  name = "terravm"
  machine_type = "e2-medium"
  zone = "asia-south1-b"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }

  }
  
  network_interface { 
    network = "default"
  }
}


