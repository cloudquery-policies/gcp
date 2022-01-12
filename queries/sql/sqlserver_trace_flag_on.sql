SELECT gsi.project_id, gsi.name, gsi.self_link AS link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'SQLSERVER%'
    AND (settings_database_flags IS NULL
        OR settings_database_flags ->> '3625' != 'off'
        OR settings_database_flags ->> '3625' IS NULL);
