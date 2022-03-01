FROM quay.io/keycloak/keycloak:latest
ENV TZ=Europe/Paris
COPY keycloak-franceconnect-2.4-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments
COPY keycloak-rest-provider-1.0-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments
RUN mkdir /opt/jboss/keycloak/themes/df
ADD df  /opt/jboss/keycloak/themes/df
ADD df-partner  /opt/jboss/keycloak/themes/df-partner
EXPOSE 8080

