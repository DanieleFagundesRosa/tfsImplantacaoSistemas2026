#!/bin/bash

# Aborta o script se algum comando falhar
set -e

echo "1. Instalando Nginx..."
sudo apt update
sudo apt install nginx -y

echo "2. Preparando o diretório web e permissões..."
sudo mkdir -p /var/www/technova

# Define o usuário que rodar o script como dono, e o Nginx (www-data) como grupo
sudo chown -R $USER:www-data /var/www/technova

# Configura as permissões de segurança (750)
sudo chmod -R 750 /var/www/technova

echo "3. Copiando arquivos do site..."
# Copia tudo da pasta website do repositório para o servidor
cp -r ../website/* /var/www/technova/

echo "4. Configurando o Nginx..."
sudo cp ../nginx/site.conf /etc/nginx/sites-available/technova.conf
sudo ln -sf /etc/nginx/sites-available/technova.conf /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

echo "5. Reiniciando o servidor..."
sudo systemctl enable nginx
sudo systemctl restart nginx

echo "✅ Deploy concluído com sucesso! O professor já pode acessar http://localhost"