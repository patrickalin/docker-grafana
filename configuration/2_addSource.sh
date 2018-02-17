KEY=eyJrIjoiSnNPS2NHQ3ZzQ2FiM20ycUg1YnpzaVo2Z2psVW01NmwiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoxfQ==
HOST="http://grafana.services.alin.be/api"

echo ""
echo ""
echo "------------------------"
echo "ADD DATASOURCE"
echo "------------------------"

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"elasticsearch",
  "type":"elasticsearch",
  "url":"http://elasticsearch.services.alin.be",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":true,
  "basicAuthUser":"elastic",
  "basicAuthPassword":"changeme"
}'

echo ""

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"prometheus",
  "type":"prometheus",
  "url":"http://prometheus.services.alin.be",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

echo ""

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"faasPrometheus",
  "type":"prometheus",
  "url":"http://morpheus.alin.be:9090",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

echo ""

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"kong",
  "type":"graphite",
  "url":"http://morpheus.alin.be:7051",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

echo ""

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"statd",
  "type":"graphite",
  "url":"https://statsd.services.alin.be/",
  "access":"proxy",
  "basicAuth":false
}'

echo ""
