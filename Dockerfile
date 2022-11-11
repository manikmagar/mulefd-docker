# Generated with JReleaser 1.2.0 at 2022-11-11T22:32:03.254093226Z
FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

LABEL "org.opencontainers.image.title"="mulefd"
LABEL "org.opencontainers.image.description"="Generate flow diagrams for Mule applications"
LABEL "org.opencontainers.image.url"="https://javastreets.com"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.version"="0.10.0"
LABEL "org.opencontainers.image.revision"="aea959e431174a80b177fb17b9eb429e9716bc5e"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip mulefd-0.10.0.zip && \
    rm mulefd-0.10.0.zip && \
    chmod +x mulefd-0.10.0/bin/mulefd

VOLUME /app

ENV PATH="${PATH}:/mulefd-0.10.0/bin"

ENTRYPOINT ["/mulefd-0.10.0/bin/mulefd"]
