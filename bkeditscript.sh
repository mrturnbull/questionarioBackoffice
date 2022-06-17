if [[ -z "${CONTEXTO_PATH}" ]]; then
	echo "ERRO! CONTEXTO_PATH em branco. ";
	exit
fi

echo "CONTEXTO_PATH=${CONTEXTO_PATH}"

echo "Digite o ID do script:"
read caminhoArq

echo "Digite o nome do arquivo de script que quer incluir (o nome da funcao DEVE ser igual ao nome da unica funcao nele existente):"
read caminhoArq

echo "Digite o nome do arquivo de script que quer incluir (o nome da funcao DEVE ser igual ao nome da unica funcao nele existente):"
read caminhoArq 

curl -v -F "file=@${caminhoArq}" ${CONTEXTO_PATH}/backoffice/script ;