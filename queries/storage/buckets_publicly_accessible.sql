SELECT project_id , "name", self_link as link from gcp_public_buckets_accesses
WHERE member LIKE '%allUsers%'
OR member LIKE '%allAuthenticatedUsers%'
GROUP BY project_id , "name", self_link;