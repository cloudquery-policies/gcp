SELECT project_id , "name", gci.self_link as link
FROM gcp_compute_instances gci
WHERE confidential_instance_config_enable_confidential_compute = FALSE;