FROM maven:3.5-jdk-8 as BUILD
 
COPY src /src
COPY pom.xml /
RUN mvn clean install

FROM anapsix/alpine-java

COPY --from=BUILD /target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar
CMD ["java","-jar","/home/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
