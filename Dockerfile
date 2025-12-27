# Use TOMCAT with Java 11
FROM tomcat:9-jdk11

# Delete the default Tomcat apps (optional, keeps server clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the webapps folder
COPY dist/OnlineQuizSystem.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
