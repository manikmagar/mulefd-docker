# Generated with JReleaser 1.2.0 at 2022-10-26T01:03:32.944178251Z
FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

LABEL "org.opencontainers.image.title"="mulefd"
LABEL "org.opencontainers.image.description"="Generate flow diagrams for Mule applications"
LABEL "org.opencontainers.image.url"="https://javastreets.com"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.version"="0.9.0"
LABEL "org.opencontainers.image.revision"="b64563b55b925c744665f3397ff1bbe14f933ac0"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip mulefd-0.9.0.zip && \
    rm mulefd-0.9.0.zip && \
    chmod +x mulefd-0.9.0/bin/mulefd

VOLUME /app

ENV PATH="${PATH}:/mulefd-0.9.0/bin"

ENTRYPOINT ["/mulefd-0.9.0/bin/mulefd"]
