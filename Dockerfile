FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

RUN curl -Ls "https://github.com/manikmagar/mulefd/releases/download/v0.7.4/mulefd-0.7.4.zip" --output mulefd.zip \
              && jar xf mulefd.zip && mv mulefd-* mulefd && chmod +x mulefd/bin/mulefd

ENTRYPOINT ["/mulefd/bin/mulefd"]