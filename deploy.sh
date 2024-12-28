set -eu

yellow='\033[1;33m'
green='\033[0;32m'
nc='\033[0m'

# these host folder names determine the docker compose default network names used by nginx
echo "$yellow Uploading docker and env files to m4sdev..."
scp -r nginx m4sdev:/home/nginx
scp -r n8n m4sdev:/home/n8n
scp -r supabase/docker m4sdev:/home/supabase
echo "$green ...done."

echo "$yellow Pulling images on m4sdev..."
ssh m4sdev bash -s << EOF
cd /home/nginx && docker compose pull
cd /home/n8n && docker compose pull
cd /home/supabase && docker compose pull
EOF
echo "$green ...done."

echo "$yellow Starting services on m4sdev..."
ssh m4sdev bash -s << EOF
cd /home/nginx && docker compose up -d
cd /home/n8n && docker compose up -d
cd /home/supabase && docker compose up -d
EOF
echo "$green ...done."

echo "$green Deployed!$nc"