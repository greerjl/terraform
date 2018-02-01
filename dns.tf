provider "google" {
  region      = "[REGION ID]"
  project     = "[PROJECT ID]"
}

resource "google_dns_managed_zone" "[COMPANY]" {
  name        = "[COMPANY]"
  dns_name    = "[COMPANY].com."
  description = "Root Public DNS zone"
  project     = "[PROJECT ID]"
}

resource "google_dns_managed_zone" "demo" {
  name        = "demo-zone"
  dns_name    = "demo.[COMPANY].com."
  description = "DEMO Public DNS zone"
  project     = "[PROJECT ID]"
}

resource "google_dns_managed_zone" "test" {
  name        = "test-zone"
  dns_name    = "test.[COMPANY].com."
  description = "TEST Public DNS zone"
  project     = "[PROJECT ID]"
}

#Terraform doesn't like '@'
resource "google_dns_record_set" "at" {
    name = "@.${google_dns_managed_zone.[COMPANY].dns_name}"
    managed_zone = "${google_dns_managed_zone.[COMPANY].name}"
    type = "A"
    ttl = "60"
    rrdatas = ["IP"]
}

resource "google_dns_record_set" "demo" {
    name = "demo.${google_dns_managed_zone.kp.dns_name}"
    managed_zone = "${google_dns_managed_zone.kp.name}"
    type = "A"
    ttl = "60"
    rrdatas = ["IP"]
}

resource "google_dns_record_set" "wiki" {
    name = "wiki.${google_dns_managed_zone.[COMPANY].dns_name}"
    managed_zone = "${google_dns_managed_zone.[COMPANY].name}"
    type = "A"
    ttl = "60"
    rrdatas = ["IP"]
}

resource "google_dns_record_set" "www" {
    name = "www.${google_dns_managed_zone.[COMPANY].dns_name}"
    managed_zone = "${google_dns_managed_zone.[COMPANY].name}"
    type = "CNAME"
    ttl = "60"
    rrdatas = ["[COMPANY].com."]
}

