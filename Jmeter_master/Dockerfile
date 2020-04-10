FROM jmeter:base

EXPOSE 60000

ARG AWS_KEY='<YOUR ACCESS KEY>'
ARG AWS_SECRET_KEY='<YOUR SECRET ACCESS KEY>'
ARG AWS_REGION='us-east-1'

RUN \
   wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
   wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk && \
   wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-bin-2.31-r0.apk && \
   wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-i18n-2.31-r0.apk && \
   apk add --no-cache glibc-2.31-r0.apk && \
   apk add --no-cache glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk && \
   /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
   apk add --no-cache zlib && \
   wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
   mv awscliv2.zip /opt && \
   mv /awscli-exe-linux-x86_64.zip /opt && \
   cd opt && \
   unzip awscli-exe-linux-x86_64.zip && \
   cd aws && \
   ./install && \
   cd .. && \
   rm awscli-exe-linux-x86_64.zip && \
   rm awscliv2.zip && \
   /usr/local/bin/aws --version && \
   aws configure set aws_access_key_id ${AWS_KEY} && \
   aws configure set aws_secret_access_key ${AWS_SECRET_KEY} && \
   aws configure set default.region ${AWS_REGION}

COPY entrypoint.sh /

RUN chmod +x ./entrypoint.sh

ENTRYPOINT	["/entrypoint.sh"]