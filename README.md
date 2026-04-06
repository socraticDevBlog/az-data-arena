![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white)

# azure data arena

## local environment

### files to create and populate

```bash

mkdir .secrets && cd .secrets
echo "password123" > postgres_password
echo "password123" > grafana_password

echo "POSTGRES_PASSWORD=$(cat postgres_password)" > ../.env

```

### capabilities

- postgresql
- grafana

### using the command line terminal

ℹ️ use [gnu make](https://www.gnu.org/software/make/manual/make.html) commands to execute stuff in this project

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

#### what was done and ready to use

from "Sleep_health_and_lifestyle_dataset" found on <kaggle.com>

imported it in a `postgresql` database

plugged a `grafana` instance to that database and used a `xy` visualization to
illustrate the correlation between blood pressure, body mass index and sleep quality

#### run it on your machine

1. browse to <http://localhost:3000/d/adt2xfj/health-visualization?orgId=1>
2. log in as `user`:`admin` and `password`:`admin`
3. skip the password change
4. peruse the dashboard

![Grafana dashboard showing the correlation between body mass, blood pressure
and quality of sleep](grafana-health-sleep.png "As Blood Pressure Rises, Sleep Quality Falls")

![Grafana dashboard showing the correlation between time spent on social media
and mental health](grafana-social-mental-health.png "Relationship Between Usage Hours and Mental Health")