FROM tomcat:10.0.14-jdk17-temurin-focal

USER root
COPY ./target/petclinic.war /usr/local/tomcat/webapps/petclinic.war
