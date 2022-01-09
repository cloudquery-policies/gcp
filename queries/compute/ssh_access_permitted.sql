SELECT *
FROM gcp_firewall_allowed_rules
WHERE direction = 'INGRESS'
AND ( ip_protocol = 'tcp'
    OR ip_protocol = 'all' )
AND '0.0.0.0/0' = ANY (source_ranges)
AND (22 BETWEEN range_start AND range_end
    OR '22' = single_port
    OR CARDINALITY(ports) = 0
    OR ports IS NULL)