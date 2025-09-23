FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt .
RUN pip3 install --break-system-packages -r requirements.txt --no-cache-dir
COPY . .
CMD ["python3", "app.py"]
EXPOSE 80
