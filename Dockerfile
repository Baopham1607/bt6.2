-------------------------------------------------------------------------------------------------

# Giai đoạn 2: Chạy ứng dụng trên Tomcat
# Sử dụng image Tomcat chính thức, phiên bản phù hợp với JDK 17
FROM tomcat:11.0.0-jdk21-temurin

# Xóa các ứng dụng mặc định của Tomcat để tránh xung đột
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép tệp .war đã được tạo ở giai đoạn "build" vào thư mục webapps của Tomcat
# "ROOT.war" là tên chuẩn để ứng dụng của bạn chạy ở thư mục gốc (root context)
COPY --from=build /app/target/webbai5-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat khi container khởi động
CMD ["catalina.sh", "run"]