ARG ALPINE_VERSION=3.12
FROM alpine:${ALPINE_VERSION}
ARG TZ
ARG CONTAINER_PACKAGE_URL

# Set up environment variables for Consul
ENV CONSUL_VERSION=1.15.2

# Replace the package repository URL if a custom URL is provided
RUN if [ "${CONTAINER_PACKAGE_URL}" != "" ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

# Install necessary packages
RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates curl \
    && apk --no-cache add tzdata \
    && echo "$TZ" > /etc/timezone \
    && rm -rf /var/cache/apk/*

# Download and install Consul
RUN curl -fsSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip \
    && unzip consul.zip \
    && mv consul /usr/local/bin/ \
    && rm consul.zip

# Create a Consul data directory
RUN mkdir -p /consul/data && \
    mkdir -p /consul/config

# Copy your Consul configuration file into the Docker image

# Expose the Consul ports
EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp

# Set the working directory to /www
WORKDIR /www

# Set the entrypoint and default command to use the configuration directory
ENTRYPOINT ["consul"]
CMD ["agent", "-client", "0.0.0.0", "-config-dir=/config/conf.d","-data-dir=/config/data"]