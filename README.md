# m4s

`infra` → spins up Hetzner box - https://www.hetzner.com/

`nginx` → reverse proxy - https://nginx.org/

`n8n` → workflow automation - https://n8n.io/

`supabase` → backend as a service - https://github.com/supabase/supabase


# configuration
1. Create `.env` files in each folder according to the provided `.env.example`
2. Configure Nginx `default.conf.template` to proxy services to their subdomains

# deployment
```sh
# provision infra - see infra/README.md for more details
cd infra
terraform init && terraform plan
terraform apply
cd ..

# configure server and start services
./deploy.sh
```
