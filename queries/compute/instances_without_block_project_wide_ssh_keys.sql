SELECT project_id, name, self_link AS link
FROM gcp_compute_instances
WHERE metadata_items ->> 'block-project-ssh-keys' IS NULL
    OR NOT metadata_items ->> 'block-project-ssh-keys' = ANY ('{1,true,True,TRUE,y,yes}');
