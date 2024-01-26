FROM nginx
COPY --from=sikalabs/goexpandenv:v0.1.0 /usr/local/bin/goexpandenv /usr/local/bin/goexpandenv
COPY entrypoint.sh /entrypoint.sh
COPY index.html.envtemplate /usr/share/nginx/html/index.html.envtemplate
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
