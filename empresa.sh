#!/bin/bash

#Cabeçalho
cabecalho() {
echo "==================================="
echo "CYBERTECH SOLUTIONS"
echo "==================================="
echo "Bem-vindo(a) ao servidor"
echo
echo "Usuário......: "$nome
echo "Data.........: "$(date +%x)
echo "Hora.........: "$(date +%X)
echo "Diretório....: "$(pwd)
echo
echo "==================================="
echo "Sistema iniciado com SUCESSO"
echo "==================================="
echo
}

#Saudação
#loop enquanto a variável estiver vazia
while [ -z "$nome" ]; do
read -p "Nome....: " nome
done
echo
echo "Olá, $nome!"
echo
cabecalho


#Informações
informacoes() {
echo 
echo "================================="
echo "INFORMAÇÕES DO SISTEMA "
echo "================================="
echo "OS..............: "$(uname -s)
echo "Versão Kernel...: "$(uname -r)
echo "================================="
echo
echo "Pressione ENTER para voltar ao menu..."
read
}


#status
status() {
echo
echo "================================="
echo "STATUS DO SISTEMA"
echo "================================="
echo "Tempo ligado....: "$(uptime -p)
echo "Espaço Livre....: "$(df -h . | awk 'NR==2 {print $4}')
echo "================================="
echo
echo "Pressione ENTER para voltar ao menu..."
read
}


#Link
link() { 
echo
echo "========================================"
echo "Abrindo o site da Cybertech Solutions..."
echo "========================================"
echo "Vai abrir o google"
xdg-open "https://www.google.com"
echo
echo "Pressione ENTER para voltar ao menu..."
read
}


#Verificação de usuário
verificar(){
echo
echo "========================================"
echo "VERIFICAÇÃO DE USER"
echo "========================================"
echo
#loop até que a condição seja parada
while true
do
echo "Digite seu nome (ou SAIR para finalizar): "
read usuario

#para sair
if [ "$usuario" = "sair" ]; then
echo
echo "========================"
echo "Saindo do script..."
echo "========================"
echo
break
fi

#verificação no /etc/passwd para ver se o usuário esta "cadastrado"
if grep -q "^$usuario:" /etc/passwd; then
echo
echo "========================================"
echo "O usuário $usuario --> EXISTE <-- no sistema!"
else
echo "========================================"
echo "O usuário $usuario --> NÃO EXISTE<-- no sistema!"
fi

echo "========================================"
echo
echo
done

}

#Verificação de diretórios
verificar_dir(){
echo
echo "========================================"
echo "VERIFICAÇÃO DE DIRETÓRIOS"
echo "========================================"
echo
#loop até que a condição seja parada
while true
do
echo "Digite o nome de um diretório (ou 'sair' para finalizar): "
read dir

#para sair
if [ "$dir" = "sair" ]; then
echo
echo "========================"
echo "Saindo do script..."
echo "========================"
echo
break
fi

#verificação do dir (todos os diretorios) para ver se o diretório existe
if [ -d "$dir" ]; then
echo
echo "========================================"
echo "O diretório --> EXISTE <-- no sistema!"
else
echo "========================================"
echo "O diretório --> NÃO EXISTE<-- no sistema!"
fi

echo "========================================"
echo
echo
done

}


#Créditos
creditos() {
echo
echo "================================="
echo "CRÉDITOS"
echo "================================="
echo "Desenvolvido para fins educacionais"
echo "(c) 2026 CyberTech Solutions"
echo "================================="
echo
echo "Pressione ENTER para voltar ao menu..."
read
}


#Menu
while true
do
echo
echo "======================="
echo "Menu"
echo "======================="
echo "1 - Informações do Sistema"
echo "2 - Status do sistema"
echo "3 - Site da Empresa"
echo "4 - Verificação de usuário"
echo "5 - Verificação de Diretórios"
echo "6 - Créditos"
echo "0 - Sair"
read -p "Escolha uma opção...: " opcao

case $opcao in
1) 
informacoes
;;
2) 
status
;;
3) 
link
;;
4) 
verificar
;;
5) 
verificar_dir
;;
6) 
creditos
;;
0) 
echo "Sistema ENCERRADO"
exit
;;
*) 
echo "Opção inválida!"
esac
done

