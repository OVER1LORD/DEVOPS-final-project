FROM tomcat:8.5.47-jdk8-openjdk
WORKDIR /var/lib/jenkins/workspace/dev-final/target

COPY ./helloworld.war /usr/local/tomcat/webapps/myapp.war
