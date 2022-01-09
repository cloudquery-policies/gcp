SELECT project_id , "role", "member"
FROM gcp_project_policy_members
WHERE "member" LIKE '%allUsers%'
OR "member" LIKE '%allAuthenticatedUsers%';