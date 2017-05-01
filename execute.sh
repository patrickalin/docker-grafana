echo "Test Key"
echo "----------"

KEY=eyJrIjoicVg3WWV2NGRpaTVwa25qblAwNmpMQkFoc0ZNdWRubWkiLCJuIjoiYWRtaW5LZXkiLCJpZCI6MX0=
HOST="https://alert.services.alin.be/api"

curl -k -H "Authorization: Bearer $KEY" $HOST/dashboards/home

echo ""
echo "ADD DATASOURCE"
echo "----------"

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"kong",
  "type":"graphite",
  "url":"http://morpheus.alin.be:7051",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"statd",
  "type":"graphite",
  "url":"https://statsd.services.alin.be/",
  "access":"proxy",
  "basicAuth":false
}'

echo ""
echo "CHANNEL ALERT"
echo "----------"

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/alert-notifications -H "Content-Type: application/json" -X POST -d '{
  "name":"new alert mail",
  "type":"email",
  "isDefault": true,
  "settings": {
    "addresses": "patrickalin@gmail.com"
  }
}'
