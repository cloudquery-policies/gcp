SELECT project_id, name, self_link as link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'SQLSERVER%'
AND settings_backup_enabled = FALSE;