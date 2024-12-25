#!/bin/bash

echo "Seja bem-vindo ao script de instalação de dependências"

# Loop principal
while true; do
    # Exibe as opções para o usuário
    echo "Escolha uma das opções abaixo e aperte ENTER:
    
    [1] Instalar Dependências
    [2] Verificar Dependências Instaladas
    [3] Remover Dependências
    [4] Sair"
    
    # Captura a opção do usuário
    read opcao

    # Verifica qual opção o usuário escolheu
    case $opcao in
        1)
            echo "Você escolheu a opção 1 - Instalar Dependências"
            # Aqui pode adicionar o código para instalar dependências
            ;;
        2)
            echo "Você escolheu a opção 2 - Verificar Dependências Instaladas"
            # Aqui pode adicionar o código para verificar dependências
            ;;
        3)
            echo "Você escolheu a opção 3 - Remover Dependências"
            # Aqui pode adicionar o código para remover dependências
            ;;
        4)
            echo "Saindo do script. Até logo!"
            break
            ;;
        *)
            echo "Opção inválida! Por favor, escolha uma opção válida."
            ;;
    esac
done

