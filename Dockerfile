# Generated with JReleaser 1.3.1 at 2022-11-23T23:11:08.105199397Z
FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

LABEL "org.opencontainers.image.title"="mulefd"
LABEL "org.opencontainers.image.description"="Generate flow diagrams for Mule applications"
LABEL "org.opencontainers.image.url"="https://javastreets.com"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.version"="0.11.0"
LABEL "org.opencontainers.image.revision"="3634498afa7178dd3a7d59b2698eaff860db2242"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip mulefd-0.11.0.zip && \
    rm mulefd-0.11.0.zip && \
    chmod +x mulefd-0.11.0/bin/mulefd

VOLUME /app

ENV PATH="${PATH}:/mulefd-0.11.0/bin"

ENTRYPOINT ["/mulefd-0.11.0/bin/mulefd"]
