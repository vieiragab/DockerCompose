FROM openjdk:8-jdk-alpine
WORKDIR /usr/src/app
RUN addgroup -S myuser && adduser -S myuser -G myuser
USER myuser:myuser
RUN apk update \
    && apk add libaio libnsl \
    && wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basiclite-linux.x64-21.1.0.0.0.zip \
    && unzip instantclient-basiclite-linux.x64-21.1.0.0.0.zip -d /usr/local/ \
    && rm instantclient-basiclite-linux.x64-21.1.0.0.0.zip \
    && ln -s /usr/local/instantclient_21_1/libclntsh.so.21.1 /usr/local/instantclient_21_1/libclntsh.so \
    && ln -s /usr/local/instantclient_21_1/libocci.so.21.1 /usr/local/instantclient_21_1/libocci.so \
    && apk del wget unzip
ENV ORACLE_HOME=/usr/local/instantclient_21_1
ENV PATH=$PATH:$ORACLE_HOME
ENV LD_LIBRARY_PATH=$ORACLE_HOME
RUN ./mvnw clean package -DskipTests
CMD ["java", "-jar", "target/my-app.jar"]
