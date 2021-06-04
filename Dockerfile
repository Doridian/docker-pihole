FROM pihole/pihole

RUN echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/buster-backports.list
RUN apt update && apt -y install keepalived/buster-backports stubby && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
RUN useradd -s /bin/false keepalived_script

COPY services/ /etc/services.d/
RUN chmod +x /etc/services.d/*/run
