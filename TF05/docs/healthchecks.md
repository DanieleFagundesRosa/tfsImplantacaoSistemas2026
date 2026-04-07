# Guia de Healthchecks Inteligentes

O sistema utiliza múltiplos tipos de verificação configurados via YAML.

## Tipos Implementados
- **HTTP**: Verifica a disponibilidade de aplicações web (Frontend e API) validando o Status Code 200.
- **TCP**: Verifica se portas específicas (como a 3306 do MySQL) estão abertas e aceitando conexões.
- **Database**: A API realiza uma consulta `SELECT 1` para confirmar que o motor do banco de dados está processando requisições.

## Configuração
As definições de intervalo, timeout e retentativas estão centralizadas em `config/healthchecks.yml`, permitindo ajustes sem alteração no código fonte da API.