FROM quay.io/keycloak/keycloak:25.0
ENV TZ=Europe/Paris
COPY keycloak-franceconnect-7.0.0.jar /opt/keycloak/standalone/deployments/keycloak-franceconnect-7.0.0.jar
ADD theme/df /opt/keycloak/themes/df
ADD theme/df-owner /opt/keycloak/themes/df-owner

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
