SELECT d.project_id, d.id, d.friendly_name, d.self_link AS dataset_link, a.special_group AS "group" , a."role"
FROM gcp_bigquery_datasets d
JOIN gcp_bigquery_dataset_accesses a ON
        d.id = a.dataset_id
WHERE a."role" = 'allUsers'
OR a."role" = 'allAuthenticatedUsers';