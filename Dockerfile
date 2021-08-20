FROM sunbird/openjdk-java11-alpine:latest
WORKDIR /home
RUN apk update \
    && apk add unzip \
    && apk add curl \
    && mkdir -p /home
COPY ./user-service/target/user-service-1.0-SNAPSHOT-dist.zip /home
RUN unzip /home/user-service-1.0-SNAPSHOT-dist.zip -d /home
RUN rm /home/user-service-1.0-SNAPSHOT-dist.zip
CMD java -cp '/home/user-service-1.0-SNAPSHOT/lib/*' play.core.server.ProdServerStart /home/user-service-1.0-SNAPSHOT