SELECT *
FROM gcp_log_metric_filters
WHERE
    enabled = TRUE
    AND "filter" ~ '\s*protoPayload.methodName\s*=\s*"SetIamPolicy"\s*AND\s*protoPayload.serviceData.policyDelta.auditConfigDeltas:*\s*'; -- noqa
