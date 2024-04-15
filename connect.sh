curl --location 'localhost:8083/connectors' \
--header 'Content-Type: application/json' \
--data '{
    "name": "twitter-connector",
    "config": {
        "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
        "tasks.max": 1,
        "connection.url": "jdbc:mysql://host.docker.internal:3306/twitter",
        "connection.user": "admin",
        "connection.password": "admin",
        "mode": "incrementing",
        "incrementing.column.name": "ID",
        "numeric.mapping": "best_fit",
        "query": "SELECT ID,TWEET,ACTIVE_STATUS,DATA_DATE FROM POST",
        "poll.interval.ms": 10000,
        "topic.prefix": "twitter.post",
        "key.converter": "org.apache.kafka.connect.storage.StringConverter",
        "value.converter": "org.apache.kafka.connect.json.JsonConverter",
        "validate.non.null": "false",
        "value.converter.schemas.enable": "false",
        "topic.creation.default.replication.factor": 1,
        "topic.creation.default.partitions": 1
    }
}'