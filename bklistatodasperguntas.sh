if [[ -z "${CONTEXTO_PATH}" ]]; then
	echo "ERRO! CONTEXTO_PATH em branco. ";
	exit
fi

echo "CONTEXTO_PATH=${CONTEXTO_PATH}"

curl -v ${CONTEXTO_PATH}/backoffice/perguntas