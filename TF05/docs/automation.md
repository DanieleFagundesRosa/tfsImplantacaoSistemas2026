# Documentação de Automação - TF05

Este documento descreve o fluxo de automação implementado para o sistema TechNova.

## Scripts de Fluxo
1. **Build (`build.sh`)**: Realiza a limpeza de imagens antigas e constrói as novas imagens Docker sem utilizar cache, garantindo que as versões mais recentes do código sejam aplicadas.
2. **Deploy (`deploy.sh`)**: Executa o backup das configurações atuais e sobe os serviços em modo *detached*.
3. **Rollback (`rollback.sh`)**: Em caso de falha crítica, este script restaura as configurações a partir do último backup realizado e reinicia os containers.

## Manutenção de Recursos
O script `cleanup.sh` é responsável por remover volumes órfãos, containers parados e limpar logs excedentes do Docker para preservar o espaço em disco do servidor.