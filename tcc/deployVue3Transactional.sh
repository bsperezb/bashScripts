#!/bin/bash

cd /root/tcc-vue3/tcc-transaccional-v3-smk

# 1. git pull origin master
git pull origin master
# Get nvm path
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
source ~/.bashrc

# Use node 18 to vue3
nvm use v18

# Verificar si la ejecución de 'git pull origin master' fue exitosa antes de continuar
if [ $? -eq 0 ]; then
  # 2. npm run build
  npm run build

  # Verificar si la ejecución de 'npm run build' fue exitosa antes de continuar
  if [ $? -eq 0 ]; then
    # 3. mv dist/ /var/www/html
    mv dist/ /var/www/html

    # 4. cd /var/www/html
    cd /var/www/html || exit

    # 5. Verificar si el directorio tcc-transaccional-vue3-old existe antes de eliminarlo
    if [ -d "tcc-transaccional-vue3-old" ]; then
      rm -rf tcc-transaccional-vue3-old
    fi

    # 6. mv tcc-transaccional-vue3/ tcc-transaccional-vue3-old
    mv tcc-transaccional-vue3/ tcc-transaccional-vue3-old

    # 7. mv dist/ tcc-transaccional-vue3
    mv dist/ tcc-transaccional-vue3
    echo "Task completed successfully"
  else
    echo "Error: npm run build failed. Aborting script."
  fi
else
  echo "Error: git pull origin master failed. Aborting script."
fi

# use nvm default
nvm use default
