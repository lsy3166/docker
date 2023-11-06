FROM openjdk:17-jdk

# Add Author info
LABEL maintainer="lsy316"

# Add a volume to /tmp
VOLUME /tmp

EXPOSE 8088

# The application's jar file
ARG JAR_FILE_NAME=docker-0.0.1-SNAPSHOT.jar
ARG JAR_FILE=build/libs/${JAR_FILE_NAME}

# Add the application's jar to the container
ADD ${JAR_FILE} ${JAR_FILE_NAME}

# Run the jar file
ENV E_JAR_FILE_NAME=/${JAR_FILE_NAME}
ENTRYPOINT java -Dspring.profiles.active=dev -jar ${E_JAR_FILE_NAME}

# 스프링 부트 gradle build
# ./gradlew clean
# ./gradlew build && java -jar build/libs/docker-0.0.1-SNAPSHOT.jar

# docker build 후 아래 실행 
# docker build --tag gs-spring-boot-docker:0.1 .
# docker run --name gs-spring-boot-docker -p 8088:8088 -d gs-spring-boot-docker:0.1 .
