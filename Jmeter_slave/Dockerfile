FROM jmeter:base

EXPOSE 1099 50000

COPY entrypoint.sh /

RUN chmod +x ./entrypoint.sh

ENTRYPOINT	["/entrypoint.sh"]
