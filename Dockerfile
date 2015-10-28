FROM logstash

VOLUME /logs

RUN /opt/logstash/bin/plugin install logstash-filter-aggregate

ADD etc/logstash /etc/logstash/

CMD ["logstash", "-f", "/etc/logstash/conf.d"]
