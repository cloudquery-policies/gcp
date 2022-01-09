SELECT project_id , "name", self_link as link
FROM gcp_compute_instances 
WHERE can_ip_forward = TRUE;