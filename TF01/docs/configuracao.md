# Relatório de Configuração do Servidor Web

## 1. Estrutura do Servidor (Nginx)
Para o deploy da PsiTech Inovação, utilizamos o servidor Nginx configurado com um Virtual Host dedicado:
- **Arquivo de Configuração:** `/etc/nginx/sites-available/technova.conf`
- **Diretório Raiz:** `/var/www/technova`
- **Logs de Erro:** Localizados em `/var/log/nginx/technova_error.log`

## 2. Gerenciamento de Permissões
Seguindo o princípio do menor privilégio, aplicamos as seguintes regras:
- **Propriedade:** O diretório pertence ao usuário do sistema, com o grupo associado ao `www-data` (Nginx).
- **Permissões (750):** - O proprietário tem permissões totais (`rwx`).
    - O grupo (servidor) possui permissão de leitura e execução (`r-x`).
    - Outros usuários não possuem acesso aos diretórios da aplicação.

## 3. Automação de Deploy
A atualização do ambiente foi automatizada via shell script (`install.sh`), que realiza a limpeza do diretório de produção, sincroniza os arquivos do repositório e reinicia o serviço Nginx de forma atômica.