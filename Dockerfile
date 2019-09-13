FROM swaggerapi/swagger-ui:v3.23.9

ENV CONFIG_URL /apis/swagger-config.json
COPY run.sh /run.sh
CMD ["/run.sh"]
EXPOSE 8080