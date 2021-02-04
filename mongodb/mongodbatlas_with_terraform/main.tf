terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

provider "mongodbatlas" {}

resource "mongodbatlas_cluster" "cluster-test" {
  project_id                   = "x"
  name                         = "cluster-test"
  num_shards                   = 1
  replication_factor           = 3
  provider_backup_enabled      = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "4.4"
  provider_name                = "AWS"
  disk_size_gb                 = 128
  provider_volume_type         = "STANDARD"
  provider_encrypt_ebs_volume  = true
  provider_instance_size_name  = "M10"
  provider_region_name         = "US_WEST_2"
}
