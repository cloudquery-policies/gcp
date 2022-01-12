SELECT
    project_id,
    gisa.id AS "account_id",
    gisak.name AS "key_name",
    gisak.valid_after_time
FROM gcp_iam_service_accounts gisa
    JOIN gcp_iam_service_account_keys gisak ON
            gisa.cq_id = gisak.service_account_cq_id
WHERE gisa.email LIKE '%iam.gserviceaccount.com'
    AND gisak.valid_after_time <=
        (now() - INTERVAL '90' day) -- noqa
