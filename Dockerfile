FROM tomcat:8.5.47-jdk8-openjdk


COPY ./var/lib/jenkins/workspace/dev-final/target/helloworld.war /usr/local/tomcat/webapps/myapp.war
