SELECT project_id , "role", "member"
    FROM gcp_project_policy_members
WHERE "role" IN ( 'roles/iam.serviceAccountUser', 'roles/iam.serviceAccountTokenCreator')
AND "member" LIKE 'user:%';