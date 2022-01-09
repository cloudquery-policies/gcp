SELECT gcn.id, gcn.project_id , gcn.name AS network_name, gcn.self_link as network_link, gdp.name AS policy_network_name
FROM gcp_compute_networks gcn
JOIN gcp_dns_policy_networks gdpn ON
gcn.self_link = REPLACE(gdpn.network_url, 'compute.googleapis', 'www.googleapis')
JOIN gcp_dns_policies gdp ON
gdp.id = gdpn.policy_id
WHERE gdp.enable_logging = FALSE;