SELECT project_id , gci."name", gci.self_link as link
FROM gcp_compute_instances gci
JOIN gcp_compute_instance_service_accounts gcisa ON
gci.id = gcisa.instance_id
WHERE gci."name" NOT LIKE 'gke-'
AND gcisa.email = (SELECT default_service_account
FROM gcp_compute_projects
WHERE project_id = gci.project_id);