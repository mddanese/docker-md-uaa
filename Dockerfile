FROM java:openjdk-8u66-jre
MAINTAINER md

ENV UAA_CONFIG_PATH /uaa
ENV CATALINA_HOME /tomcat
ENV DB_ENV_USER root
ENV DB_ENV_PASSWORD GY9fm_e6+bXQ
ENV LOGIN_CONFIG_URL=file:///tomcat/webapps/uaa/WEB-INF/classes/required_configuration.yml
ADD run.sh /tmp/
ADD dev.yml /uaa/uaa.yml
RUN chmod +x /tmp/run.sh
ADD apache-tomcat-8.0.28.tar.gz /tmp/
RUN mkdir /tomcat
RUN mv /tmp/apache-tomcat-8.0.28/* /tomcat
RUN rm -rf /tomcat/webapps/*

ADD cloudfoundry-identity-uaa-3.10.0-SNAPSHOT.war /tomcat/webapps/
RUN mv /tomcat/webapps/cloudfoundry-identity-uaa-3.10.0-SNAPSHOT.war /tomcat/webapps/uaa.war

#VOLUME ["/uaa"]

EXPOSE 8080

CMD ["/tmp/run.sh"]
