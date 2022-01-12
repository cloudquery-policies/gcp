SELECT project_id, name, self_link AS link
FROM gcp_storage_buckets
WHERE iam_configuration_uniform_bucket_level_access_enabled = FALSE;
