FROM openjdk:jdk-slim as builder

RUN mkdir -p /build/
WORKDIR /build/

COPY . /build/

# Install maven
RUN apt-get update &&  \
    apt-get install -y maven git

# Builds the launcher
RUN mvn package && \
    mv target/vnflauncher-1.0-SNAPSHOT-jar-with-dependencies.jar /vnflauncher.jar

FROM openjdk:8-jre-alpine

ENV LINKS=http://localhost
LABEL license="GPLv3+"

WORKDIR /srv/

COPY --from=builder /vnflauncher.jar /srv/vnflauncher.jar
EXPOSE 80

ENTRYPOINT ["java", "-jar", "harbor.jar", "80", "$LINKS"]
