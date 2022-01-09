SELECT gcf.project_id, gcf.id, gcf.name, gcf.self_link AS link, count(*) AS broken_rules
FROM gcp_compute_firewalls gcf
JOIN gcp_compute_firewall_allowed gcfa ON
gcf.cq_id = gcfa.firewall_cq_id
WHERE NOT ARRAY ['35.191.0.0/16', '130.211.0.0/22'] <@ gcf.source_ranges and  NOT (ip_protocol = 'tcp' and ports @> ARRAY ['80'])
GROUP BY gcf.project_id, gcf.id
HAVING count(*) > 0;