# docker_kafka

Docker composition for Kafka (kafka -- zookeeper -- kafka-ui)

## Commands

### List of commands

```bash
make
```

### Preparation

The necessary `.env` and `.kafka` files are created to start

```bash
make prepare
```

### Start

```bash
make start
```

### Stop

```bash
make stop
```

### Get IP

Get IP address of kafka_zookeeper container

```bash
make get_zookeeper_ip
```

Get IP address of kafka container

```bash
make get_kafka_ip
```

Get IP address of kafka_ui container

```bash
make get_kafka_ui_ip
```

## `.env` file

* `TIMEZONE` -- time zone inside containers. Default: `Europe/London`.

### ZOOKEEPER

* `ZOOKEEPER_PORT` -- port outside the container `kafka_zookeeper`. Default: `2181`.
* `ZOOKEEPER_RESTART` -- whether to restart the container. Default: `no`.

### KAFKA

* `KAFKA_PORT` -- port outside the container `kafka`. Default: `9092`.
* `KAFKA_RESTART` -- whether to restart the container. Default: `no`.

### KAFKA_UI

* `KAFKA_UI_PORT` -- port outside the container `kafka_ui`. Default: `8080`.
* `KAFKA_UI_RESTART` -- whether to restart the container. Default: `no`.

## `.env.kafka` file

* `KAFKA_CREATE_TOPICS` -- default: `"my-topic:1:1"`
* `KAFKA_LOG_RETENTION_MS` -- default: `86400000`
* `KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS` -- default: `7200000`

## Links

* [Github: grumpy-docker/docker-kafka](https://github.com/grumpy-docker/docker-kafka)
* [2. Docker Restart Policy](https://www.baeldung.com/ops/docker-compose-restart-policies#docker-restart-policy)
