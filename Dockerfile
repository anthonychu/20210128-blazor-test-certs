FROM mcr.microsoft.com/appsvc/staticappsclient:stable

# Install ca-certificates from bullseye repository: https://github.com/NuGet/Announcements/issues/49
RUN echo "deb http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i '$ d' /etc/apt/sources.list

COPY . /app