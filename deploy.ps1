scp -r dist/* root@domek:/volume1/node/www/
ssh -n -f root@domek '/volume1/node/restart_server.sh > /dev/null 2>&1 &'
echo "Enter server and restart node"
