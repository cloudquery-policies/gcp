SELECT * FROM gcp_log_metric_filters WHERE
    enabled = TRUE
AND "filter" ~ '\s*resource.type\s*=\s*gcs_bucket\s*AND\s*protoPayload.methodName\s*=\s*"storage.setIamPermissions"\s*';