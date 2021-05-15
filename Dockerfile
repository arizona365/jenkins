FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./sprint/target/	SpringBootMavenExample-*.war /usr/app/
WORKDIR /usr/app

CMD java -war 	SpringBootMavenExample-*.war
