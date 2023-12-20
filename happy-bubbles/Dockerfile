ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH=aarch64
# hadolint ignore=DL3003
RUN \
    apk add --no-cache --virtual .build-dependencies \
        unzip=6.0-r14 \
        wget=1.21.4-r0 \
    \
    && apk add --no-cache \
        lua-resty-http=0.17.1-r0 \
        nginx-mod-http-lua=1.24.0-r14 \
        nginx=1.24.0-r14 \
    \
    && wget "https://github.com/happy-bubbles/presence/releases/download/1.8.3/presence_linux_arm.zip" \
    && unzip -d /opt "presence_linux_arm.zip" \
    && rm "presence_linux_arm.zip" \
    \
    && apk del --no-cache --purge .build-dependencies \
    && rm -fr \
        /tmp/* \
        /var/{cache,log}/* \
        /var/lib/apt/lists/* \
        /etc/nginx \
    \
    && mkdir -p /var/log/nginx \
    && touch /var/log/nginx/error.log


 # Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Happy Bubbles" \
    io.hass.description="Easy presence detection with Bluetooth beacons" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.title="Happy Bubbles" \
    org.opencontainers.image.description="Easy presence detection with Bluetooth beacons" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/hassio-addons/addon-happy-bubbles" \
    org.opencontainers.image.documentation="https://github.com/hassio-addons/addon-happy-bubbles/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
