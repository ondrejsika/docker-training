FROM python:3.14-slim
WORKDIR /app
RUN ln -s /dev/stdout out.log
COPY log_to_file.py .
CMD ["python", "log_to_file.py"]
