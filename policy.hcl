policy "gcp" {
  configuration {
    provider "gcp" {
      version = ">= 0.4.0"
    }
  }

  policy "cis_v1.2.0" {
      source = file("cis_v1.2.0/policy.hcl")
  }
}