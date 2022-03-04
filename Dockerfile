FROM quay.io/keycloak/keycloak-x:latest
ENV TZ=Europe/Paris
COPY keycloak-franceconnect-4.1.0.jar /opt/keycloak/standalone/deployments
COPY keycloak-rest-provider-1.0-SNAPSHOT.jar /opt/keycloak/standalone/deployments
RUN mkdir /opt/keycloak/themes/df
ADD df  /opt/keycloak/themes/df
EXPOSE 8080

