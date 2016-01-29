apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -

apt-get update

apt-get install -y git
apt-get install -y nodejs
apt-get install -y mongodb-org

gem install sass
npm install -g bower gulp coffee-script --no-bin-linkss

su - vagrant -c "cd /vagrant/client && npm install --no-bin-links"
su - vagrant -c "cd /vagrant/server && npm install --no-bin-links"

npm rebuild node-sass
