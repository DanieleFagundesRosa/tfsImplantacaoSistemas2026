# TF05 - Sistema de Monitoramento e Automação

Este documento detalha a arquitetura, os componentes e os processos de automação de uma aplicação, focado em alta disponibilidade e monitoramento inteligente.

## Aluno
- **Nome:** [Daniele Fagundes Rosa]
- **RA:** [6324661]
- **Curso:** Análise e Desenvolvimento de Sistemas

---

## Estrutura do Projeto

A organização das pastas segue as melhores práticas de **DevOps**, separando responsabilidades entre infraestrutura, aplicação e monitoramento.

```text
TF05/
├── api/                # Backend em Python (Flask) para coleta de métricas
├── config/             # Configurações YAML (Healthchecks, Alertas)
├── dashboard/          # Interface Web (HTML/JS) de monitoramento
├── database/           # Scripts de inicialização do MySQL
├── docs/               # Documentação técnica detalhada
├── scripts/            # Automação de Build, Deploy e Manutenção
└── docker-compose.yml  # Orquestração de containers
```

---

## Papel dos Componentes

1. **Docker Compose** (docker-compose.yml)
O mapa da infraestrutura. Ele define como os containers se conectam, quais portas estão abertas e como os dados são persistidos. É a ferramenta que executa o plano definido.

2. **Scripts de Automação** (/scripts)
São os procedimentos operacionais. Eles envolvem o Docker Compose com camadas de segurança (backup), validação e manutenção que o Docker sozinho não realiza.

---

## Fluxo de Execução

Para operar o sistema de forma segura, siga a ordem dos scripts abaixo:

### Construção:

```Bash
./scripts/build.sh
```
Garante que as imagens estão atualizadas e sem erros.

### Implantação:

```Bash
./scripts/deploy.sh
```
Faz o backup das configurações e sobe o sistema.

### Monitoramento:

```Bash
./scripts/health-monitor.sh
```
Verifica o status de saúde dos serviços via terminal.

### Limpeza:

```Bash
./scripts/cleanup.sh
```
Remove resíduos e libera espaço em disco.

---

## Monitoramento
O sistema está configurado para realizar três tipos de validações essenciais:

1. **HTTP**: Verifica se as páginas web e APIs estão respondendo (Status 200).

2. **TCP**: Garante que as portas de comunicação (como a do Banco de Dados) estão abertas.

3. **Database**: Executa comandos simples no SQL para confirmar que o banco está processando dados.

4. **Pro-Tip**: Sempre verifique o Dashboard em http://localhost:3000 após um deploy para confirmar visualmente se todos os indicadores estão verdes.