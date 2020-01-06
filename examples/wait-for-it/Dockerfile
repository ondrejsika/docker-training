FROM debian:10-slim
COPY entrypoint.sh /
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 80
