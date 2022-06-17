if [[ -z "${CONTEXTO_PATH}" ]]; then
	echo "ERRO! CONTEXTO_PATH em branco. ";
	exit
fi
echo "CONTEXTO_PATH=${CONTEXTO_PATH}"

if [ $# -eq 0 ]; then
	echo "ERRO! Numero da Pergunta em branco";
else
	curl -v ${CONTEXTO_PATH}/backoffice/perguntas/${1}/alternativas;
fi