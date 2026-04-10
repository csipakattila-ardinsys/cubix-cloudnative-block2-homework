FROM quay.io/drsylent/cubix/block2/homework-base:java21
LABEL cubix.homework.owner="Csipak Attila"
ENV CUBIX_HOMEWORK="Csipak Attila"
ENV APP_DEFAULT_MESSAGE=""
USER 1001
WORKDIR /opt/app
COPY --chown=1001 target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
