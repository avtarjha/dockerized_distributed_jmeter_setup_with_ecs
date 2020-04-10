sed -i 's/\("${HEAP:="\)\(.*\)\("}"\)/\1-Xms'${Xms}' -Xmx'${Xmx}' -XX:MaxMetaspaceSize='${MaxMetaspaceSize}'\3/' ${JMETER_BIN}/jmeter &&

$JMETER_HOME/bin/jmeter-server \
	-Dserver.rmi.localport=60000 \
	-Dserver.rmi.ssl.disable=true \
	-Djava.rmi.server.hostname=$HostIP

exec "$@"