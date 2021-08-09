#!/bin/bash

source .env

<< 'Comment'
    description: Este sh tem como finalidade realizar o clone do repositorio bitbucket
    Exemplos de como executar:
    /bin/bash 
Comment

die () {
    echo >&2 "$@"
    Help
    exit 2
}

Help()
{
   echo "Add arguments on run."
   echo
   echo "Follow example:"
   echo "/bin/bash mytelegram SET 'Mensagem a ser enviada.'"
   echo 
}

PROJECT=$1
DIR_DEST=$2

[ "$#" -eq 2 ] || die

FUNC=$1
MENSAGEM=`echo $2 | sed "s, ,%20,g"`

QTD=$#

case ${FUNC} in 
    MSG)
        ${CMD} ${URL}'bot'${ID}':'${TAG_ID}'/sendMessage?chat_id=918501368&text='${MENSAGEM}'' ;;
    DOC)
        curl --location --request POST 'https://api.telegram.org/bot'${ID}':'${TAG_ID}'/sendDocument' \
            --header 'Content-Type: application/json' \
            --data-raw '{
                "chat_id":"918501368",
                "document":"https://leobreda.net/download/lorem-ipsum.pdf",
                "caption":"Lorem Ipsum samet dolor"
            }' ;;
    *)
        echo "ALGO" ;;
esac


