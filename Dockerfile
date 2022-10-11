# Generated with JReleaser 1.2.0 at 2022-10-11T00:23:54.376526383Z
FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

LABEL "org.opencontainers.image.title"="mulefd"
LABEL "org.opencontainers.image.description"="Generate flow diagrams for Mule applications"
LABEL "org.opencontainers.image.url"="https://javastreets.com"
LABEL "org.opencontainers.image.licenses"="MIT"
LABEL "org.opencontainers.image.version"="0.8.2"
LABEL "org.opencontainers.image.revision"="50a8ae81e6318dcc03a46fd42d1bdd1d2f8fa95b"

RUN apt-get update -y
RUN apt-get install unzip

COPY assembly/ /

RUN unzip mulefd-0.8.2.zip && \
    rm mulefd-0.8.2.zip && \
    chmod +x mulefd-0.8.2/bin/mulefd

VOLUME /app

ENV PATH="${PATH}:/mulefd-0.8.2/bin"

ENTRYPOINT ["/mulefd-0.8.2/bin/mulefd"]
