FROM tomcat:8.5.47-jdk8-openjdk


COPY /dev-final/target/helloworld.war /usr/local/tomcat/webapps/myapp.war
