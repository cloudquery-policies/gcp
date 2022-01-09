SELECT project_id , gci."name", gci.self_link as link
FROM gcp_compute_instances gci
WHERE shielded_instance_config_enable_integrity_monitoring = FALSE
OR shielded_instance_config_enable_vtpm = FALSE;