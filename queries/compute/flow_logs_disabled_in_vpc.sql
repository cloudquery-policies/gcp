SELECT gcn.id, gcn.project_id, gcn.self_link AS network, gcs.self_link AS subnetwork, gcs.enable_flow_logs
FROM gcp_compute_networks gcn
    JOIN gcp_compute_subnetworks gcs ON
        gcn.self_link = gcs.network
WHERE gcs.enable_flow_logs = FALSE;
