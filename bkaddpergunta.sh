if [[ -z "${CONTEXTO_PATH}" ]]; then
	echo "ERRO! CONTEXTO_PATH em branco. ";
	exit
fi

if [ $# -eq 0 ]; then
	echo "ERRO! Parametros ENUNCIADO(String), REQUIRED(Bit) e BLOCO(Int) em branco.";
elif [ $# -eq 1 ]; then
	echo "ERRO! Só 1 argumento digitado ! Parametros ENUNCIADO(String) ou REQUIRED(Bit) ou BLOCO(Int) em branco. ";
#elif [ $# -eq 2 ]; then
#	echo "ERRO! Só 2 argumentos digitados ! Parametros ENUNCIADO(String) ou REQUIRED(Bit) ou BLOCO(Int) em branco. ";
else

	url="${CONTEXTO_PATH}/backoffice/perguntas"

	echo $url

	json="{'id': 1, 'enunciado': '${1}', 'alternativas': [], 'tipo': 0, 'ordem': 1, 'visivel': 1, 'isRequired': ${2}}"

	json=`echo $json | sed "s/\'/\"/g"` 

	echo $json	

	curl -d "$json" -H 'Content-Type: application/json; charset=UTF-8' "$url" ;

fi

