SELECT project_id , "role", "member"
FROM gcp_project_policy_members
WHERE ("role" IN ( 'roles/editor', 'roles/owner')
    OR "role" LIKE ANY (ARRAY['%Admin', '%admin']))
AND "member" LIKE 'serviceAccount:%';