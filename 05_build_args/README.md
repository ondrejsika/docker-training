# Build default arg

```
docker build -t example05 .
```

# Build with arguments

```
docker build -t example05-2.7 . --build-arg PYTHON_IMAGE_VERSION=2.7
docker build -t example05-3.6 . --build-arg PYTHON_IMAGE_VERSION=3.6
docker build -t example05-3.6-slim . --build-arg PYTHON_IMAGE_VERSION=3.6-slim
```

# Run

```
docker run example05
docker run example05-2.7
docker run example05-3.6
docker run example05-3.6-slim
```

Go <http://localhost>
