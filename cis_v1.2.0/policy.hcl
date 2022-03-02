policy "cis_v1.2.0" {
  title = "GCP CIS V1.2.0 Policy"
  doc   = file("cis_v1.2.0/README.md")


  policy "gcp-cis-section-1" {
    title = "Section 1"
    doc   = file("cis_v1.2.0/docs/1.md")

    view "gcp_project_policy_members" {
      title = "GCP project policy members"
      query = file("queries/iam/project_policy_members.sql")
    }

    check "1.1" {
      title = "Ensure that corporate login credentials are used (Automated)"
      doc   = file("cis_v1.2.0/docs/1.1.md")
      query = <<EOF
      SELECT 'needs to list folders and organizations which is currently not supported'
    EOF
    }

    check "1.2" {
      title = "Ensure that multi-factor authentication is enabled for all non-service accounts (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/1.2.md")
    }

    check "1.3" {
      title = "Ensure that Security Key Enforcement is enabled for all admin accounts (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/1.3.md")
    }

    check "1.4" {
      title = "Ensure that there are only GCP-managed service account keys for each service account (Automated)"
      query = file("queries/iam/managed_service_account_keys.sql")
      doc   = file("cis_v1.2.0/docs/1.4.md")
    }

    check "1.5" {
      title = "Ensure that Service Account has no Admin privileges (Automated)"
      query = file("queries/iam/service_account_admin_priv.sql")
      doc   = file("cis_v1.2.0/docs/1.5.md")
    }

    check "1.6" {
      title = "Ensure that IAM users are not assigned the Service Account User or Service Account Token Creator roles at project level (Automated)"
      query = file("queries/iam/users_with_service_account_token_creator_role.sql")
      doc   = file("cis_v1.2.0/docs/1.6.md")
    }

    check "1.7" {
      title = "Ensure user-managed/external keys for service accounts are rotated every 90 days or less (Automated)"
      query = file("queries/iam/service_account_keys_not_rotated.sql")
      doc   = file("cis_v1.2.0/docs/1.7.md")
    }

    check "1.8" {
      title = "Ensure that Separation of duties is enforced while assigning service account related roles to users (Automated)"
      query = file("queries/iam/seperation_of_duties.sql")
      doc   = file("cis_v1.2.0/docs/1.8.md")
    }

    check "1.9" {
      title = "Ensure that Cloud KMS cryptokeys are not anonymously or publicly accessible (Automated)"
      query = file("queries/kms/publicly_accessible.sql")
      doc   = file("cis_v1.2.0/docs/1.9.md")
    }

    check "1.10" {
      title = "Ensure KMS encryption keys are rotated within a period of 90 days (Automated)"
      query = file("queries/kms/keys_not_rotated_within_90_days.sql")
      doc   = file("cis_v1.2.0/docs/1.10.md")
    }

    check "1.11" {
      title = "Ensure that Separation of duties is enforced while assigning KMS related roles to users (Automated)"
      doc   = file("cis_v1.2.0/docs/1.11.md")
      query = <<EOF
        SELECT project_id , "role", "member"
        FROM gcp_project_policy_members
        WHERE "role" = 'cloudkms.admin'
        AND "member" LIKE 'user:%';
    EOF
    }

    check "1.12" {
      title = "Ensure API keys are not created for a project (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/1.12.md")
    }

    check "1.13" {
      title = "Ensure API keys are restricted to use by only specified Hosts and Apps (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/1.13.md")
    }

    check "1.14" {
      title = "Ensure API keys are restricted to only APIs that application needs access (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/1.14.md")
    }

    check "1.15" {
      title = "Ensure API keys are rotated every 90 days (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/1.15.md")
    }
  }

  policy "gcp-cis-section-2" {
    title = "Section 2"
    doc   = file("cis_v1.2.0/docs/2.md")

    view "gcp_log_metric_filters" {
      title = "GCP Log Metric Filter and Alarm"
      query = file("queries/logging/log_metric_filters.sql")
    }

    check "2.1" {
      title = "Ensure that Cloud Audit Logging is configured properly across all services and all users from a project (Automated)"
      query = file("queries/logging/not_configured_across_services_and_users.sql")
      doc   = file("cis_v1.2.0/docs/2.1.md")
    }

    check "2.2" {
      title = "Ensure that sinks are configured for all log entries (Automated)"
      query = file("queries/logging/sinks_not_configured_for_all_log_entries.sql")
      doc   = file("cis_v1.2.0/docs/2.2.md")
    }

    check "2.3" {
      title = "Ensure that retention policies on log buckets are configured using Bucket Lock (Automated)"
      query = file("queries/logging/log_buckets_retention_policy_disabled.sql")
      doc   = file("cis_v1.2.0/docs/2.3.md")
    }

    check "2.4" {
      title         = "Ensure log metric filter and alerts exist for project ownership assignments/changes (Automated)"
      expect_output = true
      query         = file("queries/logging/project_ownership_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.4.md")
    }

    check "2.5" {
      title         = "Ensure that the log metric filter and alerts exist for Audit Configuration changes (Automated)"
      expect_output = true
      query         = file("queries/logging/audit_config_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.5.md")
    }

    check "2.6" {
      title         = "Ensure that the log metric filter and alerts exist for Custom Role changes (Automated)"
      expect_output = true
      query         = file("queries/logging/custom_role_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.6.md")
    }

    check "2.7" {
      title         = "Ensure that the log metric filter and alerts exist for VPC Network Firewall rule changes (Automated)"
      expect_output = true
      query         = file("queries/logging/vpc_firewall_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.7.md")
    }

    check "2.8" {
      title         = "Ensure that the log metric filter and alerts exist for VPC network route changes (Automated)"
      expect_output = true
      query         = file("queries/logging/vpc_route_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.8.md")
    }

    check "2.9" {
      title         = "Ensure that the log metric filter and alerts exist for VPC network changes (Automated)"
      expect_output = true
      query         = file("queries/logging/vpc_network_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.9.md")
    }

    check "2.10" {
      title         = "Ensure that the log metric filter and alerts exist for Cloud Storage IAM permission changes (Automated)"
      expect_output = true
      query         = file("queries/logging/storage_iam_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.10.md")
    }

    check "2.11" {
      title         = "Ensure that the log metric filter and alerts exist for SQL instance configuration changes (Automated)"
      expect_output = true
      query         = file("queries/logging/sql_instance_changes_without_log_metric_filter_alerts.sql")
      doc           = file("cis_v1.2.0/docs/2.11.md")
    }

    check "2.12" {
      title = "Ensure that Cloud DNS logging is enabled for all VPC networks (Automated)"
      query = file("queries/logging/dns_logging_disabled.sql")
      doc   = file("cis_v1.2.0/docs/2.12.md")
    }
  }

  policy "gcp-cis-section-3" {
    title = "Section 3"
    doc   = file("cis_v1.2.0/docs/3.md")

    view "gcp_firewall_allowed_rules" {
      title = "firewall allowed rules port ranges dissasembled"
      query = file("queries/compute/firewall_allowed_rules.sql")
    }

    check "3.1" {
      title = "Ensure that the default network does not exist in a project (Automated)"
      query = file("queries/compute/default_network_exist.sql")
      doc   = file("cis_v1.2.0/docs/3.1.md")
    }

    check "3.2" {
      title = "Ensure legacy networks do not exist for a project (Automated)"
      query = file("queries/compute/legacy_network_exist.sql")
      doc   = file("cis_v1.2.0/docs/3.2.md")
    }

    check "3.3" {
      title = "Ensure that DNSSEC is enabled for Cloud DNS (Automated)"
      query = file("queries/compute/dnssec_disabled.sql")
      doc   = file("cis_v1.2.0/docs/3.3.md")
    }

    check "3.4" {
      title = "Ensure that RSASHA1 is not used for the key-signing key in Cloud DNS DNSSEC (Manual)"
      query = file("queries/dns/key_signing_with_rsasha1.sql")
      doc   = file("cis_v1.2.0/docs/3.4.md")
    }

    check "3.5" {
      title = "Ensure that RSASHA1 is not used for the zone-signing key in Cloud DNS DNSSEC (Manual)"
      query = file("queries/dns/zone_signing_with_rsasha1.sql")
      doc   = file("cis_v1.2.0/docs/3.5.md")
    }

    check "3.6" {
      title = "Ensure that SSH access is restricted from the internet (Automated)"
      query = file("queries/compute/ssh_access_permitted.sql")
      doc   = file("cis_v1.2.0/docs/3.6.md")
    }

    check "3.7" {
      title = "Ensure that RDP access is restricted from the Internet (Automated)"
      query = file("queries/compute/rdp_access_permitted.sql")
      doc   = file("cis_v1.2.0/docs/3.7.md")
    }

    check "3.8" {
      title = "Ensure that VPC Flow Logs is enabled for every subnet in a VPC Network (Automated)"
      query = file("queries/compute/flow_logs_disabled_in_vpc.sql")
      doc   = file("cis_v1.2.0/docs/3.8.md")
    }

    check "3.9" {
      title = "Ensure no HTTPS or SSL proxy load balancers permit SSL policies with weak cipher suites (Manual)"
      query = file("queries/compute/ssl_proxy_with_weak_cipher.sql")
      doc   = file("cis_v1.2.0/docs/3.9.md")
    }

    check "3.10" {
      title = "GCP CIS3.10 Ensure Firewall Rules for instances behind Identity Aware Proxy (IAP) only allow the traffic from Google Cloud Loadbalancer (GCLB) Health Check and Proxy Addresses (Manual)"
      query = file("queries/compute/allow_traffic_behind_iap.sql")
      doc   = file("cis_v1.2.0/docs/3.10.md")
    }
  }

  policy "gcp-cis-section-4" {
    title = "Section 4"
    doc   = file("cis_v1.2.0/docs/4.md")

    check "4.1" {
      title = "Ensure that instances are not configured to use the default service account (Automated)"
      query = file("queries/compute/instances_with_default_service_account.sql")
      doc   = file("cis_v1.2.0/docs/4.1.md")
    }

    check "4.2" {
      title = "Ensure that instances are not configured to use the default service account with full access to all Cloud APIs (Automated)"
      query = file("queries/compute/instances_with_default_service_account_with_full_access.sql")
      doc   = file("cis_v1.2.0/docs/4.2.md")
    }

    check "4.3" {
      title = "Ensure 'Block Project-wide SSH keys' is enabled for VM instances (Automated)"
      query = file("queries/compute/instances_without_block_project_wide_ssh_keys.sql")
      doc   = file("cis_v1.2.0/docs/4.3.md")
    }

    check "4.4" {
      title = "Ensure oslogin is enabled for a Project (Automated)"
      query = file("queries/compute/oslogin_disabled.sql")
      doc   = file("cis_v1.2.0/docs/4.4.md")
    }

    check "4.5" {
      title = "Ensure 'Enable connecting to serial ports' is not enabled for VM Instance (Automated)"
      query = file("queries/compute/serial_port_connection_enabled.sql")
      doc   = file("cis_v1.2.0/docs/4.5.md")
    }

    check "4.6" {
      title = "Ensure that IP forwarding is not enabled on Instances (Automated)"
      query = file("queries/compute/instance_ip_forwarding_enabled.sql")
      doc   = file("cis_v1.2.0/docs/4.6.md")
    }

    check "4.7" {
      title = "Ensure VM disks for critical VMs are encrypted with Customer-Supplied Encryption Keys (CSEK) (Automated)"
      query = file("queries/compute/disks_encrypted_with_csek.sql")
      doc   = file("cis_v1.2.0/docs/4.7.md")
    }


    check "4.8" {
      title = "Ensure Compute instances are launched with Shielded VM enabled (Automated)"
      query = file("queries/compute/instances_with_shielded_vm_disabled.sql")
      doc   = file("cis_v1.2.0/docs/4.8.md")
    }

    check "4.9" {
      title = "Ensure that Compute instances do not have public IP addresses (Automated)"
      query = file("queries/compute/instances_with_public_ip.sql")
      doc   = file("cis_v1.2.0/docs/4.9.md")
    }

    check "4.10" {
      title = "Ensure that App Engine applications enforce HTTPS connections (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/4.10.md")
    }

    check "4.11" {
      title = "Ensure that Compute instances have Confidential Computing enabled (Automated)"
      query = file("queries/compute/instances_without_confidential_computing.sql")
      doc   = file("cis_v1.2.0/docs/4.11.md")
    }
  }

  policy "gcp-cis-section-5" {
    title = "Section 5"
    doc   = file("cis_v1.2.0/docs/5.md")

    view "gcp_public_buckets_accesses" {
      title = "Aggregated buckets and their access params"
      query = file("queries/storage/buckets_permissions.sql")
    }

    check "5.1" {
      title = "Ensure that Cloud Storage bucket is not anonymously or publicly accessible (Automated)"
      query = file("queries/storage/buckets_publicly_accessible.sql")
      doc   = file("cis_v1.2.0/docs/5.1.md")
    }

    check "5.2" {
      title = "Ensure that Cloud Storage buckets have uniform bucket-level access enabled (Automated)"
      query = file("queries/storage/buckets_without_uniform_bucket_level_access.sql")
      doc   = file("cis_v1.2.0/docs/5.2.md")
    }
  }

  policy "gcp-cis-section-6" {
    title = "Section 6"
    doc   = file("cis_v1.2.0/docs/6.md")

    check "6.1.1" {
      title = "6.1.1 Ensure that a MySQL database instance does not allow anyone to connect with administrative privileges (Automated)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/6.1.1.md")
    }

    check "6.1.2" {
      title = "6.1.2 Ensure 'skip_show_database' database flag for Cloud SQL Mysql instance is set to 'on' (Automated)"
      query = file("queries/sql/mysql_skip_show_database_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.1.2.md")
    }

    check "6.1.3" {
      title = "6.1.3 Ensure that the 'local_infile' database flag for a Cloud SQL Mysql instance is set to 'off' (Automated)"
      query = file("queries/sql/mysql_local_inline_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.1.3.md")
    }

    check "6.2.1" {
      title = "6.2.1 Ensure that the 'log_checkpoints' database flag for Cloud SQL PostgreSQL instance is set to 'on' (Automated)"
      query = file("queries/sql/postgresql_log_checkpoints_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.1.md")
    }

    check "6.2.2" {
      title = "6.2.2 Ensure 'log_error_verbosity' database flag for Cloud SQL PostgreSQL instance is set to 'DEFAULT' or stricter (Manual)"
      query = file("queries/sql/postgresql_log_error_verbosity_flag_not_strict.sql")
      doc   = file("cis_v1.2.0/docs/6.2.2.md")
    }

    check "6.2.3" {
      title = "6.2.3 Ensure that the 'log_connections' database flag for Cloud SQL PostgreSQL instance is set to 'on' (Automated)"
      query = file("queries/sql/postgresql_log_connections_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.3.md")
    }

    check "6.2.4" {
      title = "6.2.4 Ensure that the 'log_disconnections' database flag for Cloud SQL PostgreSQL instance is set to 'on' (Automated)"
      query = file("queries/sql/postgresql_log_disconnections_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.4.md")
    }

    check "6.2.5" {
      title = "6.2.5 Ensure 'log_duration' database flag for Cloud SQL PostgreSQL instance is set to 'on' (Manual)"
      query = file("queries/sql/postgresql_log_duration_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.5.md")
    }

    check "6.2.6" {
      title = "6.2.6 Ensure that the 'log_lock_waits' database flag for Cloud SQL PostgreSQL instance is set to 'on' (Automated)"
      query = file("queries/sql/postgresql_log_lock_waits_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.6.md")
    }

    check "6.2.7" {
      title = "6.2.7 Ensure 'log_statement' database flag for Cloud SQL PostgreSQL instance is set appropriately (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/6.2.7.md")
    }

    check "6.2.8" {
      title = "6.2.8 Ensure 'log_hostname' database flag for Cloud SQL PostgreSQL instance is set appropriately (Automated)"
      query = file("queries/sql/postgresql_log_hostname_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.8.md")
    }

    check "6.2.9" {
      title = "6.2.9 Ensure 'log_parser_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off' (Automated)"
      query = file("queries/sql/postgresql_log_parser_stats_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.2.9.md")
    }

    check "6.2.10" {
      title = "6.2.10 Ensure 'log_planner_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off' (Automated)"
      query = file("queries/sql/postgresql_log_planner_stats_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.2.10.md")
    }

    check "6.2.11" {
      title = "6.2.11 Ensure 'log_executor_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off' (Automated)"
      query = file("queries/sql/postgresql_log_executor_stats_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.2.11.md")
    }

    check "6.2.12" {
      title = "6.2.12 Ensure 'log_statement_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off' (Automated)"
      query = file("queries/sql/postgresql_log_statement_stats_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.2.12.md")
    }

    check "6.2.13" {
      title = "6.2.13 Ensure that the 'log_min_messages' database flag for Cloud SQL PostgreSQL instance is set appropriately (Manual)"
      query = file("queries/manual.sql")
      doc   = file("cis_v1.2.0/docs/6.2.13.md")
    }

    check "6.2.14" {
      title = "6.2.14 Ensure 'log_min_error_statement' database flag for Cloud SQL PostgreSQL instance is set to 'Error' or stricter (Automated)"
      query = file("queries/sql/postgresql_log_min_error_statement_flag_less_error.sql")
      doc   = file("cis_v1.2.0/docs/6.2.14.md")
    }

    check "6.2.15" {
      title = "6.2.15 Ensure that the 'log_temp_files' database flag for Cloud SQL PostgreSQL instance is set to '0' (on) (Automated)"
      query = file("queries/sql/postgresql_log_temp_files_flag_off.sql")
      doc   = file("cis_v1.2.0/docs/6.2.15.md")
    }

    check "6.2.16" {
      title = "6.2.16 Ensure that the 'log_min_duration_statement' database flag for Cloud SQL PostgreSQL instance is set to '-1' (disabled) (Automated)"
      query = file("queries/sql/postgresql_log_min_duration_statement_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.2.16.md")
    }

    check "6.3.1" {
      title = "6.3.1 Ensure 'external scripts enabled' database flag for Cloud SQL SQL Server instance is set to 'off' (Automated)"
      query = file("queries/sql/sqlserver_external_scripts_enabled_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.3.1.md")
    }

    check "6.3.2" {
      title = "6.3.2 Ensure that the 'cross db ownership chaining' database flag for Cloud SQL SQL Server instance is set to 'off' (Automated)"
      query = file("queries/sql/sqlserver_cross_db_ownership_chaining_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.3.2.md")
    }

    check "6.3.3" {
      title = "6.3.3 Ensure 'user connections' database flag for Cloud SQL SQL Server instance is set as appropriate (Automated)"
      query = file("queries/sql/sqlserver_user_connections_flag_not_set.sql")
      doc   = file("cis_v1.2.0/docs/6.3.3.md")
    }

    check "6.3.4" {
      title = "6.3.4 Ensure 'user options' database flag for Cloud SQL SQL Server instance is not configured (Automated)"
      query = file("queries/sql/sqlserver_user_options_flag_set.sql")
      doc   = file("cis_v1.2.0/docs/6.3.4.md")
    }

    check "6.3.5" {
      title = "6.3.5 Ensure 'remote access' database flag for Cloud SQL SQL Server instance is set to 'off' (Automated)"
      query = file("queries/sql/sqlserver_remote_access_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.3.5.md")
    }

    check "6.3.6" {
      title = "6.3.6 Ensure '3625 (trace flag)' database flag for Cloud SQL SQL Server instance is set to 'off' (Automated)"
      query = file("queries/sql/sqlserver_remote_access_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.3.6.md")
    }

    check "6.3.7" {
      title = "6.3.7 Ensure that the 'contained database authentication' database flag for Cloud SQL on the SQL Server instance is set to 'off' (Automated)"
      query = file("queries/sql/sqlserver_contained_database_authentication_flag_on.sql")
      doc   = file("cis_v1.2.0/docs/6.3.7.md")
    }

    check "6.4" {
      title = "Ensure that the Cloud SQL database instance requires all incoming connections to use SSL (Automated)"
      query = file("queries/sql/db_instance_without_ssl.sql")
      doc   = file("cis_v1.2.0/docs/6.4.md")
    }

    check "6.5" {
      title = "Ensure that Cloud SQL database instances are not open to the world (Automated)"
      query = file("queries/sql/db_instance_publicly_accessible.sql")
      doc   = file("cis_v1.2.0/docs/6.5.md")
    }

    check "6.6" {
      title = "Ensure that Cloud SQL database instances do not have public IPs (Automated)"
      query = file("queries/sql/db_instance_with_public_ip.sql")
      doc   = file("cis_v1.2.0/docs/6.6.md")
    }

    check "6.7" {
      title = "Ensure that Cloud SQL database instances are configured with automated backups (Automated)"
      query = file("queries/sql/db_instance_with_public_ip.sql")
      doc   = file("cis_v1.2.0/docs/6.7.md")
    }
  }

  policy "gcp-cis-section-7" {
    title = "Section 7"
    doc   = file("cis_v1.2.0/docs/7.md")

    check "7.1" {
      title = "Ensure that BigQuery datasets are not anonymously or publicly accessible (Automated)"
      query = file("queries/bigquery/datasets_publicly_accessible.sql")
      doc   = file("cis_v1.2.0/docs/7.1.md")
    }

    check "7.2" {
      title = "Ensure that all BigQuery Tables are encrypted with Customer-managed encryption key (CMEK) (Automated)"
      query = file("queries/bigquery/tables_not_encrypted_with_cmek.sql")
      doc   = file("cis_v1.2.0/docs/7.2.md")
    }

    check "7.3" {
      title = "Ensure that a Default Customer-managed encryption key (CMEK) is specified for all BigQuery Data Sets (Automated)"
      query = file("queries/bigquery/datasets_without_default_cmek.sql")
      doc   = file("cis_v1.2.0/docs/7.3.md")
    }
  }
}
