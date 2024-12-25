#!/bin/bash

# Cores para mensagens
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor

echo -e "${BLUE}Seja bem-vindo ao script de instalação de dependências${NC}"

# Loop principal
while true; do
    # Exibe o menu de opções
    echo -e "
Escolha uma das opções abaixo e aperte ENTER:

[1] Instalar Dependências
[2] Verificar Dependências Instaladas
[3] Remover Dependências
[4] Sair
    "

    # Captura a opção do usuário
    read -p "Digite a opção desejada: " opcao

    # Verifica qual opção o usuário escolheu
    case $opcao in
        1)
            echo -e "${BLUE}Você escolheu a opção 1 - Instalar Dependências${NC}"
            echo "Dependências a serem instaladas:
              - GCC     
              - GIT
              - VIM
              - POSTGRESQL
              - PGMODELER"

            echo -e "${BLUE}Verificando e Instalando atualizações do sistema...${NC}"
            sudo apt-get update && sudo apt-get dist-upgrade -y
            echo -e "${GREEN}Atualizações concluídas.${NC}"

            echo -e "${BLUE}Instalando dependências...${NC}"
            if sudo apt-get install -y gcc git vim postgresql pgmodeler; then
                echo -e "${GREEN}Todas as dependências foram instaladas com sucesso.${NC}"
            else
                echo -e "${RED}Houve um erro ao instalar as dependências.${NC}"
            fi
            ;;
        2)
            echo -e "${BLUE}Você escolheu a opção 2 - Verificar Dependências Instaladas${NC}"
            echo -e "${BLUE}Verificando dependências instaladas...${NC}"
            for dep in gcc git vim postgresql pgmodeler; do
                if dpkg -l | grep -q $dep; then
                    echo -e "${GREEN}$dep está instalado.${NC}"
                else
                    echo -e "${RED}$dep não está instalado.${NC}"
                fi
            done
            ;;
        3)
            echo -e "${BLUE}Você escolheu a opção 3 - Remover Dependências${NC}"
            echo -e "${RED}Removendo dependências...${NC}"
            if sudo apt-get remove --purge -y gcc git vim postgresql pgmodeler; then
                echo -e "${GREEN}Todas as dependências foram removidas com sucesso.${NC}"
            else
                echo -e "${RED}Houve um erro ao remover as dependências.${NC}"
            fi
            ;;
        4)
            echo -e "${BLUE}Tem certeza que deseja sair? (s/n)${NC}"
            read -p "Digite sua escolha: " confirm
            if [[ $confirm == "s" || $confirm == "S" ]]; then
                echo -e "${GREEN}Saindo do script. Até logo!${NC}"
                break
            else
                echo -e "${BLUE}Voltando ao menu principal...${NC}"
            fi
            ;;
        *)
            echo -e "${RED}Opção inválida! Por favor, escolha uma opção válida.${NC}"
            ;;
    esac
done


