FROM 		tomcat:8.0.21-jre8
COPY 		./target/ /usr/local/tomcat/webapps/
ENTRYPOINT  /usr/local/tomcat/bin/catalina.sh run
EXPOSE      8080