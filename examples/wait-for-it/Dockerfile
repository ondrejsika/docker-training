FROM debian:10-slim
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /
RUN chmod 777 /wait-for-it.sh
COPY entrypoint.sh /
ENTRYPOINT [ "sh", "/entrypoint.sh" ]
EXPOSE 80
