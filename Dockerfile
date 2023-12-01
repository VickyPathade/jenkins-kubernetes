FROM openjdk:11

COPY target/maven-web-app.war  /usr/app/

WORKDIR /usr/app/

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "maven-web-app.war"]
