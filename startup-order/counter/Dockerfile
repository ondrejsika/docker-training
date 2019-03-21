FROM python:3.7-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
# wait-for-it.sh
# wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod +x wait-for-it.sh
COPY wait-for-it.sh /
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["python", "app.py"]
EXPOSE 80