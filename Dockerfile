FROM tomcat:latest
ADD target/hello-world-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/hello.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
