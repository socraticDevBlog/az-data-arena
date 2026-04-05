# secrets

This folder contains secrets used by docker-compose for local development.

## postgresql

- Create `./secrets/postgres_password` with the desired PostgreSQL password on your machine.
- This repository ignores that file to avoid committing secrets (see `.gitignore`).
- For production, use your orchestrator's secrets manager instead of local files.

Example to create the file locally:

```
mkdir -p .secrets
echo "your-strong-password-here" > secrets/postgres_password
chmod 600 secrets/postgres_password
```

Keep the real secret out of version control.
