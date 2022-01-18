SELECT * FROM gcp_log_metric_filters WHERE
    enabled = TRUE
    AND "filter" = 'protoPayload.methodName="cloudsql.instances.update"';
