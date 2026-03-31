#!/bin/bash
#by Giannini Rabelo
#altere o valor da variavel URL para o endereço que irá monitorar

URL=zabbix.com.br
data=`echo | openssl s_client -servername $URL -connect $URL:${2:-443} 2>/dev/null | openssl x509 -noout -enddate | sed -e 's#notAfter=##'`

ssldate=`date -d "${data}" '+%s'`

nowdate=`date '+%s'`

diff="$((${ssldate}-${nowdate}))"

echo $((${diff}/86400))