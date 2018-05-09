apt-get update
apt-get install -y curl
apt-get install -y gnupg gnupg1 gnupg2
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt-get install -y nodejs
npm install express

apt-get install -y python-pip
pip install setuptools
easy_install supervisor

chmod +x /provision/entrypoint.sh
