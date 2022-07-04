SELECT project_id, id, self_link AS link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'SQLSERVER%'
    AND settings_backup_enabled = FALSE;
