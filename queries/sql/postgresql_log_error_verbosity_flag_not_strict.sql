SELECT gsi.project_id, gsi.name, gsi.self_link AS link
FROM gcp_sql_instances gsi
WHERE database_version LIKE 'POSTGRES%'
    AND (settings_database_flags IS NULL
        OR settings_database_flags ->> 'log_error_verbosity' NOT IN('default', 'terse')
        OR settings_database_flags ->> 'log_error_verbosity' IS NULL);
