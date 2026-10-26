# Packages the already-built CV into a tiny static server.
#
# index.html and Edward-Weston-CV.pdf are produced by build/build.sh. CI runs
# that in the Pages job and hands the output to this build as the `cv-site`
# artifact, so there is no Node or Chrome in the image. Locally, run
# ./build/build.sh before `docker compose up --build`.
FROM nginxinc/nginx-unprivileged:1.30-alpine

# The entrypoint's IPv6 auto-config cannot edit a root-owned config and logs a
# misleading "read-only file system?" warning. The CV is served over IPv4 to
# the tunnel, so keep the config root-owned and quiet the informational logs.
ENV NGINX_ENTRYPOINT_QUIET_LOGS=1

COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx index.html /usr/share/nginx/html/index.html
COPY --chown=nginx:nginx Edward-Weston-CV.pdf /usr/share/nginx/html/Edward-Weston-CV.pdf

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/ >/dev/null || exit 1
