SELECT project_id, id, name, self_link AS link
FROM gcp_compute_disks
WHERE disk_encryption_key_sha256 IS NULL
    OR disk_encryption_key_sha256 = ''
    OR source_image_encryption_key_kms_key_name IS NULL
    OR source_image_encryption_key_kms_key_name = '';
