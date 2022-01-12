SELECT project_id, gisa."name" AS "account_name", gisak.name AS "key_name", gisak."key_type"
FROM gcp_iam_service_accounts gisa
    JOIN gcp_iam_service_account_keys gisak ON
        gisa.cq_id = gisak.service_account_cq_id
WHERE gisa.email LIKE '%iam.gserviceaccount.com'
    AND gisak."key_type" = 'USER_MANAGED';
