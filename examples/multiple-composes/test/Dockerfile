FROM python:3.11-slim
WORKDIR /test
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir
COPY . .
CMD ["python", "-m", "unittest", "test_counter"]
