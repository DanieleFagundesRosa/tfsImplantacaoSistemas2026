# Plano de Manutenção Preventiva

Instruções para manter a saúde do ambiente de monitoramento.

## Tarefas Periódicas
- **Limpeza**: Executar `./scripts/cleanup.sh` semanalmente.
- **Backups**: Os backups são gerados automaticamente em cada deploy na pasta `backups/`, contendo as definições de YAML e estados do banco.
- **Monitoramento de Logs**: Verificação dos logs estruturados do Nginx e da API de métricas para identificação de gargalos de performance.