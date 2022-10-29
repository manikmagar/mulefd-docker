# Generated with JReleaser 1.2.0 at 2022-10-29T17:54:53.982700574Z
FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

LABEL "org.opencontainers.image.title"="mulefd"
LABEL "org.opencontainers.image.description"="Generate flow diagrams for Mule applications"
LABEL "org.opencontainers.image.url"="https://javastreets.com"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.version"="0.9.1"
LABEL "org.opencontainers.image.revision"="b60e1b3419d7b6b7ad09e769c2993578c832a1f8"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip mulefd-0.9.1.zip && \
    rm mulefd-0.9.1.zip && \
    chmod +x mulefd-0.9.1/bin/mulefd

VOLUME /app

ENV PATH="${PATH}:/mulefd-0.9.1/bin"

ENTRYPOINT ["/mulefd-0.9.1/bin/mulefd"]
