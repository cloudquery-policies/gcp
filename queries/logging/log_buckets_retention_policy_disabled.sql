SELECT
    gls.project_id,
    gls.name AS "sink_name",
    gsb.name AS "bucket_name",
    gsb.retention_policy_is_locked,
    gsb.retention_policy_retention_period,
    gls.destination
FROM gcp_logging_sinks gls
    JOIN gcp_storage_buckets gsb ON
        gsb.name = REPLACE(gls.destination, 'storage.googleapis.com/', '')
WHERE gls.destination LIKE 'storage.googleapis.com/%'
    AND ( gsb.retention_policy_is_locked = FALSE
        OR gsb.retention_policy_retention_period = 0)
