SELECT *
FROM gcp_compute_instances gci
JOIN gcp_compute_instance_service_accounts gcisa ON
gci.id = gcisa.instance_id
WHERE gcisa.email = (SELECT default_service_account
FROM gcp_compute_projects
WHERE project_id = gci.project_id)
AND 'https://www.googleapis.com/auth/cloud-platform' = ANY (gcisa.scopes);