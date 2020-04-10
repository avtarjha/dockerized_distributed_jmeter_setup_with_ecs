#!/bin/sh

sed -i 's/\("${HEAP:="\)\(.*\)\("}"\)/\1-Xms'${Xms}' -Xmx'${Xmx}' -XX:MaxMetaspaceSize='${MaxMetaspaceSize}'\3/' ${JMETER_BIN}/jmeter

exec "$@"