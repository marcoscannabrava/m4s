# m4s

`infra` → spins up Hetzner box - https://www.hetzner.com/

`supabase` → backend as a service - https://github.com/supabase/supabase

# deployment
```sh
# provision infra - see infra/README.md for more details
cd infra
terraform init && terraform plan
terraform apply
cd ..

# configure server
scp -r supabase/docker m4sdev:/home/supabase
scp -r infra/server/ m4sdev:/home/server

# start services
ssh m4sdev
cd /home/infra && docker compose up -d
cd /home/docker && docker compose up -d
```
