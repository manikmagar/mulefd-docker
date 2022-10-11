# Generated with JReleaser 1.2.0 at 2022-10-11T02:38:33.662478198Z
FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

LABEL "org.opencontainers.image.title"="mulefd"
LABEL "org.opencontainers.image.description"="Generate flow diagrams for Mule applications"
LABEL "org.opencontainers.image.url"="https://javastreets.com"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.version"="0.8.4"
LABEL "org.opencontainers.image.revision"="fdce56e7c203549815c4af66aa8c24018cabf8d0"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip mulefd-0.8.4.zip && \
    rm mulefd-0.8.4.zip && \
    chmod +x mulefd-0.8.4/bin/mulefd

VOLUME /app

ENV PATH="${PATH}:/mulefd-0.8.4/bin"

ENTRYPOINT ["/mulefd-0.8.4/bin/mulefd"]
