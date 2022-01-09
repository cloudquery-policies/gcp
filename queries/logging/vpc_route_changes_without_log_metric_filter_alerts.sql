SELECT * FROM gcp_log_metric_filters WHERE
enabled = TRUE
AND "filter" ~ '\s*resource.type\s*=\s*"gce_route"\s*AND\s*protoPayload.methodName\s*=\s*"beta.compute.routes.patch"\s*OR\s*protoPayload.methodName\s*=\s*"beta.compute.routes.insert"\s*';