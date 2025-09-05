
# Stage 2: chạy Tomcat 11 (Jakarta Servlet 6.1)
FROM tomcat:11.0-jdk21

# (Tuỳ chọn) Tắt shutdown port 8005 để tránh spam log
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Xoá app mặc định và deploy WAR của bạn vào ROOT (context '/')
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh","run"]
