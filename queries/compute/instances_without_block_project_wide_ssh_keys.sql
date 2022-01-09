SELECT project_id , name, self_link as link
FROM gcp_compute_instances
WHERE metadata_items IS NULL OR metadata_items ->> 'block-project-ssh-keys' IS NULL
OR metadata_items ->> 'block-project-ssh-keys' != 'true';