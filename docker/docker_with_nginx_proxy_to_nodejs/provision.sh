apt-get update
apt-get install -y curl
apt-get install -y gnupg gnupg1 gnupg2
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt-get install -y nodejs
npm install express

chmod +x /provision/entrypoint.sh
