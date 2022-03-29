SELECT gcf.project_id, gcf.id, gcf.name, gcf.self_link AS link, count(*) AS broken_rules
FROM gcp_compute_firewalls gcf
    JOIN gcp_compute_firewall_allowed gcfa ON
        gcf.cq_id = gcfa.firewall_cq_id
WHERE
    NOT ARRAY [
        '35.191.0.0/16', '130.211.0.0/22'
    ] <@ gcf.source_ranges AND NOT (ip_protocol = 'tcp' AND ports @> ARRAY ['80'])
GROUP BY 1,2,3,4
HAVING count(*) > 0;
