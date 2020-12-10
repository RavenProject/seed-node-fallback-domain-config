terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "raven-coin"

    workspaces {
      name = "domain"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.14.0"
    }
  }
}

resource "cloudflare_record" "test" {
  zone_id = "0974ebf9d4d3724fc1ae86c2522d737a"
  name    = "test"
  value   = "127.0.0.1"
  type    = "A"
}
