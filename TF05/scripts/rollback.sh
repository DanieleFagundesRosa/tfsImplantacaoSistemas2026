#!/bin/bash
# Uso: ./scripts/rollback.sh backups/nome_da_pasta_anterior
BACKUP_PATH=$1
if [ -d "$BACKUP_PATH" ]; then
    echo "Iniciando Rollback..."
    cp -r "$BACKUP_PATH/config" ../
    docker-compose up -d --build
    echo "Sistema restaurado para a versão anterior."
else
    echo "Erro: Pasta de backup não encontrada."
fi