# Giai đoạn 1: Build ứng dụng Java
# Sử dụng image Maven chính thức với JDK để build
FROM maven:3.9-eclipse-temurin-17 AS build
# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép tệp pom.xml để tải các thư viện (dependencies)
COPY pom.xml .
RUN mvn dependency:go-offline

# Sao chép toàn bộ mã nguồn của dự án
COPY src ./src

# Chạy lệnh Maven để đóng gói ứng dụng thành tệp .war
RUN mvn package -DskipTests

#----------------------------------------------------------------------------------------------------------------------------------------

# Giai đoạn 2: Chạy ứng dụng trên Tomcat
# Sử dụng image Tomcat chính thức, phiên bản phù hợp với JDK 17
FROM tomcat:9.0-jdk17-temurin-focal

# Xóa các ứng dụng mặc định của Tomcat để tránh xung đột
RUN rm -rf /usr/local/tomcat/webapps/*

# Sao chép tệp .war đã được tạo ở giai đoạn "build" vào thư mục webapps của Tomcat
# "ROOT.war" là tên chuẩn để ứng dụng của bạn chạy ở thư mục gốc (root context)
COPY --from=build /app/target/webbai5-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat khi container khởi động
CMD ["catalina.sh", "run"]