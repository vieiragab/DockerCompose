FROM alpine:3.14

RUN apk update && apk add openjdk8 maven

WORKDIR /src
COPY SpeakEasyAPI/pom.xml .
COPY SpeakEasyAPI/src .

RUN mvn clean package

CMD ["java", "-jar", "target/my-app.jar"]