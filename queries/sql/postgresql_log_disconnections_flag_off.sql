SELECT gsi.project_id, gsi.id, gsi.self_link AS link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'POSTGRES%'
    AND (settings_database_flags IS NULL
        OR settings_database_flags ->> 'log_disconnections' != 'on'
        OR settings_database_flags ->> 'log_disconnections' IS NULL);
