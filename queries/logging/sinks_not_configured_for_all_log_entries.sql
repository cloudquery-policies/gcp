WITH found_sinks AS (SELECT count(*) AS configured_sinks
FROM gcp_logging_sinks gls
WHERE gls.FILTER = '') SELECT 'no sinks for all log entries configured' AS description
FROM found_sinks
WHERE configured_sinks = 0;