#!/bin/bash

# npm run build
npm run build:dev

#Verifica si la ejecion del build fue exitosa
if [ $? -eq 0 ]; then
        mv dist/ /var/www/html
        cd /var/www/html || exit

        # Verificar si el directori falkon-dev-old existe antes de eliminarlo
        if [ -d "tcc-transaccional-old" ]; then
                rm -rf tcc-transaccional-old
        fi

        mv tcc-transaccional/ tcc-transaccional-old
        mv dist/ tcc-transaccional
        # Restart Nginx
        systemctl restart nginx.service
        echo "Task completed successfully"
else
        echo "Erro: npm run build:dev failed. Aborting script"
fi
