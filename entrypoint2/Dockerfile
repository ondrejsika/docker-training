FROM nginx
COPY entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]