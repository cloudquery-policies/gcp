SELECT
    project_id,
    gci."id",
    gci.self_link AS link
FROM gcp_compute_instances gci
    LEFT JOIN gcp_compute_instance_network_interfaces gcini ON
        gci.id = gcini.instance_id
    LEFT JOIN gcp_compute_instance_network_interface_access_configs gciniac ON
        gcini.cq_id = gciniac.instance_network_interface_cq_id
WHERE gci."name" NOT LIKE 'gke-%'
    AND (gciniac.nat_ip IS NOT NULL
        OR gciniac.nat_ip != '')
GROUP BY project_id, gci."id", gci.self_link
HAVING count(gciniac.*) > 0; -- noqa
