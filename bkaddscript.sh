if [[ -z "${VAGAS_PATH}" ]]; then
	echo "ERRO! VAGAS_PATH em branco. ";
	exit
fi

echo "VAGAS_PATH=${VAGAS_PATH}"

echo "Digite o nome do arquivo de script que quer incluir (o nome da funcao DEVE ser igual ao nome da unica funcao nele existente):"
read caminhoArq 

curl -v -F "file=@${caminhoArq}" ${VAGAS_PATH}/backoffice/script ;