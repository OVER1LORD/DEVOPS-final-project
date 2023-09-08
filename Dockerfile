FROM tomcat:8.5.47-jdk8-openjdk


COPY /workspace/dev-final/target/helloworld.war /usr/local/tomcat/webapps/myapp.war
