SELECT project_id, "role", "member"
FROM gcp_project_policy_members
WHERE "role" IN ( 'roles/iam.serviceAccountAdmin', 'roles/iam.serviceAccountUser')
    AND "member" LIKE 'user:%';
