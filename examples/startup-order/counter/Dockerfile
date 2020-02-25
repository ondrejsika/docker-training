FROM python:3.7-slim
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /
RUN chmod +x /wait-for-it.sh
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["python", "app.py"]
EXPOSE 80
