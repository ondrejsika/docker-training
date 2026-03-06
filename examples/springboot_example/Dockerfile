FROM eclipse-temurin:21-jdk AS build
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends maven && \
  rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY pom.xml .
COPY src/ src/
RUN mvn package -q -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
