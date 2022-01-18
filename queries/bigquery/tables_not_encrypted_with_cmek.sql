SELECT d.project_id, d.id, d.friendly_name, d.self_link AS dataset_link, t.self_link AS table_link
FROM gcp_bigquery_datasets d
    JOIN gcp_bigquery_dataset_tables t ON
        d.id = t.dataset_id
WHERE encryption_configuration_kms_key_name = '' OR default_encryption_configuration_kms_key_name IS NULL;
