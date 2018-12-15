FROM debian:9-slim

# Install prerequisites packages
RUN mkdir -p "/usr/share/man/man1" \
  && mkdir -p "/usr/share/man/man7" \
  && apt-get update \
  && apt-get install -y cron curl git mysql-client postgresql-client python3 tar \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean


# Install Docker
ENV DOCKERVERSION=18.03.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz


# Install bash logging library
RUN git clone --depth=1 https://github.com/idelsink/b-log.git /b-log

# Manage Backup script
COPY ./cron /etc/cron.d/backup

RUN chown root:root /etc/cron.d/backup \
  && chmod 0644 /etc/cron.d/backup \
  && touch /var/log/cron.log

CMD printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh \
  && cron \
  && tailf /var/log/cron.log
