if [[ -z "${CONTEXTO_PATH}" ]]; then
	echo "ERRO! CONTEXTO_PATH em branco. ";
	exit
fi

echo "CONTEXTO_PATH=${CONTEXTO_PATH}"

echo "Digite o ID da Pergunta:"
read pergId 
echo "Digite o texto da Alternativa: "
read descAlt
echo "Escolha o tipo de Controle entre parenteses: CEP(1), CHECKBOX(2), CNPJ(3), SELECT(4),"
echo "CPF(5), DATA(6), PASSWORD(7), RADIO(8), RANGE(9), TEXT(10), TEXTAREA(11)"
echo "TELEFONE CELULAR(12), TELEFONE FIXO(13), MONEY(14), UPLOAD(15)"
read controleId
echo "isRequired = 1 ou 0 ?"
read isRequired

url="${CONTEXTO_PATH}/backoffice/perguntas/${pergId}/alternativas" 

altId=1
tipoHTML="TEXT"
valor=""
limMin=0
limMax=0
maxLen=50
isSelecao=0
case $controleId in	

	1)  tipoHTML="CEP"; maxLen=9;  ;;

	2)  tipoHTML="CHECKBOX"
	    valor=$descAlt
	    ;;

	3)  tipoHTML="CNPJ"; maxLen=19;  ;;

	4)  tipoHTML="SELECT";
		
		isSelecao=1
		echo "Digite o nome do arquivo contendo as opcoes:"
		read caminhoArq
		 ;;

	5)  tipoHTML="CPF"; maxLen=14;  ;;	

	6)  tipoHTML="DATA"
		maxLen=10
		;;

	7)  tipoHTML="PASSWORD" 
		maxLen=8
		;;  

	8)  tipoHTML="RADIO"
		valor=$descAlt
		;;  

	9)	tipoHTML="RANGE"
		echo "Digite o limite minimo:"
		read limMin
		echo "Digite o limite maximo:" 
		read limMax
		;;

	10) tipoHTML="TEXT"
		echo "Digite o tamanho maximo do campo:" 
		read maxLen
		echo "Se usa mascara, digite o nome da classe dela. Senao, de ENTER:" 
		read classeMascara
		echo "Se usa mascara, digite o formato dela. Senao, de ENTER:" 
		read formatoMascara
		;;

	11) tipoHTML="TEXTAREA"
		echo "Digite o tamanho maximo do campo:" 
		read maxLen
		;;
	12) tipoHTML="TELEFONECELULAR"
		maxLen=14
		;;
	13) tipoHTML="TELEFONEFIXO"
		maxLen=13
		;;
	14) tipoHTML="MONEY"
		echo "Digite o tamanho maximo do campo:" 
		read maxLen
		;;	
	15) tipoHTML="FILEUPLOAD"
		valor=$descAlt
		;; 

esac

if (($isSelecao)); then 
	#echo "perguntaId=${pergId}"
	#echo "alternativaId=${altId}"
	#echo "descricao=${descAlt}"
	#echo "tipoHTML=${tipoHTML}"
	#echo "file=@${caminhoArq}"
	curl -v -F "perguntaId=${pergId}" -F "alternativaId=${altId}" -F "descricao=${descAlt}" -F "tipoHTML=${tipoHTML}" -F "isRequired=${isRequired}" -F "file=@${caminhoArq}" ${CONTEXTO_PATH}/backoffice/upload ;
else

	json="{'perguntaId': ${pergId}, 'alternativaId': ${altId}, 'descricao': '${descAlt}', 'tipoHTML': '${tipoHTML}', 'valor': '${valor}', 'limMinimo': ${limMin}, 'limMaximo': ${limMax}, 'maxLength': ${maxLen}, 'isRequired': ${isRequired}, 'classeMascara': '${classeMascara}', 'formatoMascara': '${formatoMascara}', 'opcoes':[]}"

	json=`echo $json | sed "s/\'/\"/g"` 

	echo $json

	curl -d "$json" -H 'Content-Type: application/json; charset=UTF-8' $url ;

fi



