set -eux

echo -e "\e[33mUploading docker and env files to m4sdev...\e[0m"
scp -r infra/nginx m4sdev:/home/nginx
scp -r infra/n8n m4sdev:/home/n8n
scp -r supabase/docker m4sdev:/home/supabase
echo "...upload finished."

echo "Starting services on m4sdev..."
ssh m4sdev bash -s << EOF
cd /home/nginx && docker compose up -d
cd /home/n8n && docker compose up -d
cd /home/supabase && docker compose up -d
EOF
echo "...services started."

echo -e "\e[32mDone!\e[0m"