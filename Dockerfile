FROM nginx:latest
LABEL maintainer="Chris Wieringa <cwieri39@calvin.edu>"

# Set versions and platforms
ARG BUILDDATE=20240201-1

# Do all run commands with bash
SHELL ["/bin/bash", "-c"] 

# Copy the webroot over
COPY webroot /usr/share/nginx/html

# Expose the service
EXPOSE 80/tcp

# COMMANDS
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

# Healthcheck
HEALTHCHECK --interval=5s --timeout=5s CMD curl -f http://127.0.0.1/ || exit 1
