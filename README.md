

# azure data arena

## local environment

- postgresql
- grafana

ℹ️ use `make` command to execute stuff in this project

```bash
make

# Makefile targets:
#   up         - create secret (if missing) and docker compose up -d
#   down       - docker compose down and remove all volumes
#   restart    - docker compose restart
#   logs       - follow postgres logs
#   ps         - show docker compose ps
#   exec       - open a shell in the postgres container (sh)
#   psql       - open psql as user 'app' against the service
#   rebuild    - rebuild images and recreate containers
#   secret     - interactively create the local secret file
```

### grafana visualization

from "Sleep_health_and_lifestyle_dataset" found on <kaggle.com>

import it in a `postgresql` database

plug a `grafana` instance to that database and use a `xy` visualization to
illustrate the correlation between blood pressure, body mass index and sleep quality

1. browse to <http://localhost:3000/d/adt2xfj/health-visualization?orgId=1>
2. log in as `user`:`admin` and `password`:`admin`
3. skip the password change
4. peruse the dashboard

![Grafana dashboard showing the correlation between body mass, blood pressure
and quality of sleep](grafana-health-sleep.png "As Blood Pressure Rises, Sleep Quality Falls")
