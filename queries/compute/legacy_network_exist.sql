SELECT gdmz.project_id, gdmz.id, gdmz.name, gdmz.dns_name 
FROM gcp_dns_managed_zones gdmz
WHERE gdmz.dnssec_config_state != 'on'