SELECT project_id, name, self_link AS link
FROM gcp_compute_instances
WHERE metadata_items IS NOT NULL
    AND metadata_items ->> 'serial-port-enable' = ANY ('{1,true,True,TRUE}');