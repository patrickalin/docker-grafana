# Don't edit this file, user DockerfileTemplate and buildImage.sh
###############################################
FROM registry.services.alin.be/grafana/grafana:5.0.2
COPY etc/ /etc/grafana
COPY localtime /etc/localtime
HEALTHCHECK --interval=10s --timeout=10s --retries=3 CMD curl -f http://localhost:3000/ || exit 1
