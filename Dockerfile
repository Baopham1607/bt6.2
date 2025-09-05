FROM tomcat:11.0.0-jdk21-temurin

# Xóa webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR của bạn (giữ nguyên tên Maven tạo ra)
COPY target/email-list-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Vô hiệu hóa shutdown port (8005) để tránh warning
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]
