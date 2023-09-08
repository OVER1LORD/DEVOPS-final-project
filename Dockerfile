FROM tomcat:8.5.47-jdk8-openjdk


COPY ./helloworld.war /usr/local/tomcat/webapps/myapp.war
