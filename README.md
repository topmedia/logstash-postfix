logstash-postfix
================

Aggregates postfix log events into Elasticsearch. Based on the excellent work
of [Tom Hendrikx](https://github.com/whyscream/postfix-grok-patterns).

Elasticsearch
-------------

For now the IP of the Elasticsearch cluster to talk to is hard-coded in
`etc/logstash/conf.d/99-output-elasticsearch.conf`:

    output {
      elasticsearch {
        protocol => "http"
        host => "192.168.1.95"
      }
    }

This may change to a template variable later.

Docker
------

A `Dockerfile` is provided for easy evaluation that can be fully baked
including configuration files and the required
[aggregate plugin](https://www.elastic.co/guide/en/logstash/current/plugins-filters-aggregate.html).

Build the image with:

    $ make build

Place your logs into the `logs/` sub-directory and run a container with:

    $ make run
