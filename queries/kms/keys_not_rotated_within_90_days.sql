SELECT *
FROM gcp_kms_keyring_crypto_keys gkkck
WHERE (rotation_period LIKE '%s'
    AND REPLACE(rotation_period, 's', '')::NUMERIC > 7776000)
    OR (rotation_period LIKE '%h'
        AND REPLACE(rotation_period, 'h', '')::NUMERIC > 2160)
    OR (rotation_period LIKE '%m'
        AND REPLACE(rotation_period, 'm', '')::NUMERIC > 129600)
    OR (rotation_period LIKE '%d'
        AND REPLACE(rotation_period, 'd', '')::NUMERIC > 90)
    OR DATE_PART('day', CURRENT_DATE - next_rotation_time ) > 90 ;
