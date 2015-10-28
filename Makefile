.PHONY: all build clean run console

all: build run

build:
	docker build -t topmedia/logstash .

clean:
	curl -X DELETE 'localhost:9200/logstash*'

run:
	docker run -it --rm --name logstash-postfix \
		-v $(CURDIR)/logs:/logs topmedia/logstash

console:
	docker exec -it logstash-postfix /bin/bash
