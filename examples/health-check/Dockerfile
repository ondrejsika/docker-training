FROM python:3.7-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
HEALTHCHECK --interval=5s --timeout=3s \
  CMD python check.py
CMD ["python", "server.py"]
EXPOSE 80
