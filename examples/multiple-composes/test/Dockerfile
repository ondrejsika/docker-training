FROM python:3.13-slim
WORKDIR /test
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir --break-system-packages
COPY . .
CMD ["python", "-m", "unittest", "test_counter"]
