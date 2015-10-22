# Prod Server Setup
Ubuntu 14.04
`$ apt-get update`
`$ apt-get install -y mysql-server git nodejs npm`
`$ ln -s /usr/bin/nodejs /usr/bin/node`
`$ npm install -g pm2 gulp`
`$ cd /home`
`$ git clone http://github.com/codyseibert/blog`

# Deploy
`$ cd /home/blog`
`$ git pull`

# Restart
`$ cd /home/blog/server/dist`
`$ pm2 restart server.js`
