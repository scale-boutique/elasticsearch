FROM elasticsearch:8.15.0

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

COPY --chmod=755 entrypoint-new.sh /usr/local/bin/entrypoint-new.sh

USER 0

RUN apt-get update && apt-get install -y sudo && \
    echo "elasticsearch ALL=(root) NOPASSWD: /bin/chown" > /etc/sudoers.d/elasticsearch

USER 1000:0

ENTRYPOINT ["/usr/local/bin/entrypoint-new.sh"]