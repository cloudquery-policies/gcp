SELECT gsi.project_id, gsi.id, gsi.self_link AS link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'MYSQL%'
    AND (settings_database_flags IS NULL
        OR settings_database_flags ->> 'skip_show_database' != 'on'
        OR settings_database_flags ->> 'skip_show_database' IS NULL);
