FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip3 install -r requirements.txt --break-system-packages --no-cache-dir
COPY . .
CMD ["python3", "app.py"]
EXPOSE 80
