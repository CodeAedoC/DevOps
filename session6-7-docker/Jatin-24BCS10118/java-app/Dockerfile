FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /build
COPY HelloWorldServer.java .
RUN javac HelloWorldServer.java

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /build/HelloWorldServer*.class .
EXPOSE 8080
CMD ["java", "HelloWorldServer"]
