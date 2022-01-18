# GCP Security & Compliance CloudQuery policy pack

Official GCP security & compliance policy pack for CloudQuery.

## What is CloudQuery

The [open-source](https://github.com/cloudquery/cloudquery) cloud asset inventory powered by SQL.

CloudQuery extracts, transforms, and loads your cloud assets into normalized PostgreSQL tables. CloudQuery enables you to assess, audit, and evaluate the configurations of your cloud assets.

### Links
* Homepage: https://cloudquery.io
* Documentation: https://docs.cloudquery.io
* CloudQuery Hub (providers & policies documentation): https://hub.cloudquery.io/
* Discord: https://cloudquery.io/discord

## Included Policies

- CIS v1.2.0

## Quick Start

### Prerequisite

1. [Install CloudQuery](https://docs.cloudquery.io/docs/getting-started)

```bash 
# install with brew
brew install cloudquery/tap/cloudquery
# or download precompiled binaries from https://github.com/cloudquery/cloudquery/releases
```

2. [Download and Configure GCP Provider](https://docs.cloudquery.io/docs/cli/fetch/overview)

```bash
cloudquery init gcp
```

3. [Fetch](https://hub.cloudquery.io/providers/cloudquery/gcp/latest)

```bash
# connect or run  a local PostgreSQL
docker run -p 5432:5432 -e POSTGRES_PASSWORD=pass -d postgres
# extract your cloud infra configuration
cloudquery fetch
```

### Running

```bash
# Describe what is available in the policy pack
cloudquery policy describe gcp

# Run the whole pack
cloudquery policy run gcp

# Run specific policy
cloudquery policy run gcp//cis_v1.2.0
```
