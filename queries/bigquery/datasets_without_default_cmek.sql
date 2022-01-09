SELECT project_id, id, friendly_name, self_link as link
FROM gcp_bigquery_datasets
WHERE default_encryption_configuration_kms_key_name = '' 
OR  default_encryption_configuration_kms_key_name IS NULL;