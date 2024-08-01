# Sample docker-compose to test debezium-connect data sync from MariaDB to ElasticSearch

This example is not for production use.
For production you need to configure more nodes for Kafka and ElasticSearch clusters.
Passwords for database need to be stored in correct way.
Connectors should externalize secrets as this article describes: https://debezium.io/blog/2019/12/13/externalized-secrets/
Elastic should be configured with authorization and other security options.

Also Kibana is optional.

We are using here Kafka cluster in KRaft mode to skip usage of Zookeeper.
Debezium is describing it as experimental, but Apache Kafka is claiming it is production ready from version 3.3


In docker-compose.yml we describe all needed services to start the example.
You need to download elastic-sink-connector files from: https://www.confluent.io/hub/confluentinc/kafka-connect-elasticsearch and extract all jar files from lib folder to ./connectors/elasticsearch-connector which is mounted in the right place in debezium-connect.
Additional connectors need to be mounted in folders inside /kafka/connect/ as /kafka/connect/some-connector-1.
Mounting something just to a plain /kafka/connect will overwrite default debezium-connect connectors.


Database need to enable bin log.

After docker compose up next step is to run script register-connectors.sh which registers all connectors and sinks for debezium connect to enable proper data flow.
If you want to add more data sinks you need to add proper json register file in topics folder.

Data from two tables from sample MariaDB database should sync to ElasticSearch and change when the data changes in DB.
