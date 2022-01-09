SELECT project_id , name, self_link as link
FROM gcp_compute_instances
WHERE metadata_items IS NOT NULL AND 
metadata_items ->> 'serial-port-enable' = 'true'
OR metadata_items ->> 'serial-port-enable' = '1';