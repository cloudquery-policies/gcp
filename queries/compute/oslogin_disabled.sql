SELECT project_id, name, self_link AS link
FROM gcp_compute_projects
WHERE common_instance_metadata_items IS NULL
    OR common_instance_metadata_items ->> 'enable-oslogin' IS NULL
    OR NOT common_instance_metadata_items ->> 'enable-oslogin' = ANY ('{1,true,True,TRUE,y,yes}');
