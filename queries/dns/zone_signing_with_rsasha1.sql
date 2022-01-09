SELECT gdmz.id, gdmz.project_id, gdmz.dns_name , gdmzdcdks."key_type" , gdmzdcdks.algorithm
FROM gcp_dns_managed_zones gdmz
JOIN gcp_dns_managed_zone_dnssec_config_default_key_specs gdmzdcdks ON
gdmz.id = gdmzdcdks.managed_zone_id
WHERE gdmzdcdks."key_type" = 'zoneSigning'
AND gdmzdcdks.algorithm = 'rsasha1'