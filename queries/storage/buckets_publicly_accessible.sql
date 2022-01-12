SELECT project_id, "name", self_link AS link FROM gcp_public_buckets_accesses
WHERE member LIKE '%allUsers%'
    OR member LIKE '%allAuthenticatedUsers%'
GROUP BY project_id, "name", self_link;
