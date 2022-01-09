SELECT gsi.project_id, gsi.name, gsi.self_link as link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'SQLSERVER%'
AND (settings_database_flags IS NULL 
    OR settings_database_flags ->> 'contained database authentication' != 'off'
    OR settings_database_flags ->> 'contained database authentication' IS NULL);