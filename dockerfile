FROM ubuntu:24.04
WORKDIR /

# Install the dependencies that must survive container recreation. XUI's
# bundled PHP 7.4 binary still links against OpenSSL 1.1, which is no longer
# shipped by Ubuntu 24.04, so install Ubuntu's final 1.1 compatibility package.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates sudo wget unzip dos2unix python-is-python3 python3-dev mariadb-server \
        libcurl4 libfreetype6 libjpeg-turbo8 libpng16-16t64 libxml2 libxslt1.1 \
        libmcrypt4 libmaxminddb0 libssh2-1t64 && \
    wget -q \
        https://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.24_amd64.deb \
        -O /tmp/libssl1.1.deb && \
    dpkg -i /tmp/libssl1.1.deb && \
    rm -f /tmp/libssl1.1.deb && \
    addgroup --system --gid 103 xui && \
    adduser --system --uid 103 --gid 103 --shell /bin/false --disabled-login xui && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy original xui.one & cracking file
COPY original_xui/database.sql /database.sql
COPY original_xui/xui.tar.gz /xui.tar.gz
COPY install.python3.py /install.python3.py
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

VOLUME ["/home/xui", "/var/lib/mysql"]
EXPOSE 80

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
