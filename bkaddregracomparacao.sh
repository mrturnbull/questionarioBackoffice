if [[ -z "${CONTEXTO_PATH}" ]]; then
	echo "ERRO! CONTEXTO_PATH em branco. ";
	exit
fi

echo "CONTEXTO_PATH=${CONTEXTO_PATH}"

echo "Digite o ID da pergunta:"
read perguntaId 

echo "Digite o ID da pergunta com cuja resposta vc quer comparar a resposta da pergunta anterior:"
read perguntaIDdeComparacao 

echo "Digite o ID do script:"
read scriptId 

curl -v -F "perguntaId=${perguntaId}"  -F "perguntaIDdeComparacao=${perguntaIDdeComparacao}"  -F "scriptId=${scriptId}" ${CONTEXTO_PATH}/backoffice/regra-comparacao ;