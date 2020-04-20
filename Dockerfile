FROM adoptopenjdk/openjdk8:jdk8u242-b08-ubuntu

RUN curl -Ls "https://github.com/manikmagar/mule-flow-diagrams/releases/download/v0.1.0/muleflowdiagrams-0.1.0.zip" --output muleflowdiagrams.zip \
              && jar xf muleflowdiagrams.zip && mv muleflowdiagrams-* muleflowdiagrams && chmod +x muleflowdiagrams/bin/muleflowdiagrams

ENTRYPOINT ["/muleflowdiagrams/bin/muleflowdiagrams"]