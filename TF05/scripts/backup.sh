#!/bin/bash
# Uso: ./scripts/backup.sh backups/nome_da_pasta
BACKUP_PATH=$1
mkdir -p "$BACKUP_PATH"
echo "Realizando backup das configurações..."
cp -r ../config "$BACKUP_PATH/"
echo "Backup concluído em $BACKUP_PATH"