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

# troubleshooting
```sh
# stop all services
ssh m4sdev 'docker stop $(docker ps -q)'

# clean all docker containers, images and volumes
ssh m4sdev 'docker rm $(docker ps -aq); docker rmi $(docker images -q); docker volume rm $(docker volume ls -q)'

# clean home folder
ssh m4sdev "rm -rf /home/*"
```

# adding a service
1. Create a folder with a `docker-compose.yaml` file
2. Add it to the deploy script
3. (optional) to expose it publicly
   1. Create a DNS record for a subdomain on Cloudflare
   2. Add the network to NGINX's `nginx/docker-compose.yaml`
   3. Add the proxy configuration on `nginx/default.conf.template`