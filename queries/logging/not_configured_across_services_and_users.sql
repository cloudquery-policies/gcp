WITH project_policy_audit_configs AS (
    SELECT
        project_id,
        jsonb_array_elements(p.policy -> 'auditConfigs') AS audit_config
    FROM gcp_resource_manager_projects p
),
log_types AS (
    SELECT
        project_id,
        audit_config ->> 'service' AS "service",
        jsonb_array_elements(audit_config -> 'auditLogConfigs') ->> 'logType' AS logs,
        jsonb_array_elements(audit_config -> 'auditLogConfigs') ->> 'exemptedMembers' AS exempted
    FROM project_policy_audit_configs
)
SELECT project_id, service, count(*)
FROM log_types
WHERE exempted IS NULL
    AND logs IN ('DATA_READ', 'DATA_WRITE')
    AND service = 'allServices'
GROUP BY project_id, service
--count(*) > 2 means DATA_READ and DATA_WRITE are there
HAVING count(*) = 2;
