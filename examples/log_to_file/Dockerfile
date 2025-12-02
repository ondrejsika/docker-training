FROM python:3.14-slim
WORKDIR /app
COPY log_to_file.py .
RUN ln -s /dev/stdout out.log
CMD ["python", "log_to_file.py"]
