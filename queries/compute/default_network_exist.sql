SELECT project_id, id, "name", self_link as link
FROM gcp_compute_networks gcn
WHERE name = 'default';