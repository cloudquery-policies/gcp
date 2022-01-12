SELECT project_id, id, "name", self_link AS link
FROM gcp_compute_networks gcn
WHERE name = 'default';
