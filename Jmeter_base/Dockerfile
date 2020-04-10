FROM alpine:latest
 
ARG JMETER_VERSION="5.2.1"
 
ENV JMETER_DOWNLOAD_URL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.zip
ENV Xms 256m
ENV Xmx 512m
ENV MaxMetaspaceSize 1024m
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN ${JMETER_HOME}/bin


RUN \
   apk update && \
   apk upgrade && \
   apk add --no-cache ca-certificates && \
   apk add --no-cache openjdk8-jre && \
   apk add --no-cache wget && \
   apk add --no-cache nss && \
   wget ${JMETER_DOWNLOAD_URL} && \
   apk add --no-cache unzip && \
   mv /apache-jmeter-${JMETER_VERSION}.zip /opt && \
   cd /opt && \
   unzip apache-jmeter-${JMETER_VERSION}.zip && \
   cd .. && \
   rm /opt/apache-jmeter-${JMETER_VERSION}.zip && \
   cd /opt && \
   rm -R apache-jmeter-5.2.1/docs/ && \
   rm -R apache-jmeter-5.2.1/printable_docs && \
   apk del unzip && \
   apk del wget && \
   rm -rf /var/cache/apk/*

ENV PATH $PATH:$JMETER_BIN

COPY entrypoint.sh /
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]