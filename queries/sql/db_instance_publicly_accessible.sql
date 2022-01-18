SELECT gsi.project_id, gsi.name, gsisican.name, gsi.self_link AS link
FROM gcp_sql_instances gsi
    JOIN gcp_sql_instance_settings_ip_config_authorized_networks gsisican ON
        gsi.cq_id = gsisican.instance_cq_id
WHERE database_version LIKE 'SQLSERVER%'
    AND gsisican.value = '0.0.0.0/0'
