SELECT gsi.project_id, gsi.id, gsi.self_link AS link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'SQLSERVER%'
    AND settings_ip_configuration_require_ssl = FALSE;
