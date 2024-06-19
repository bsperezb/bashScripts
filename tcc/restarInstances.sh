#!/bin/bash

# 1. Restart VPN service
systemctl restart vpntcc.service
echo "Restart VPN service"

if [ $? -eq 0 ]; then
# 2. restart Restify 
        pm2 restart restify-k
        echo "Restart Restify"
fi

if [ $? -eq 0 ]; then
        # 3. restart Tcc-gcloud (Manage pdf mercadeo)
        pm2 restart tcc-gcloud
        echo "Restart tcc-gcloud"
fi

if [ $? -eq 0 ]; then
        # 4. Restart Data base
        systemctl restart postgresql
        echo "Restart Postgresql DB service"
fi
echo "Task completed successfully"
