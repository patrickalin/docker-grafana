echo "Test Key"
echo "----------"

KEY=eyJrIjoiZmJYY2xjdk94R0s2bHlmNlVRTmFqZnRHTEZrdmlyQ3QiLCJuIjoiYWRtaW4iLCJpZCI6MX0=
HOST="http://grafana.services.alin.be/api"

curl -k -H "Authorization: Bearer $KEY" $HOST/dashboards/home

echo ""
echo ""
echo "ADD DATASOURCE"
echo "----------"

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

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"prometheus",
  "type":"prometheus",
  "url":"http://prometheus.services.alin.be",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/datasources -H "Content-Type: application/json" -X POST -d '{
  "name":"faasPrometheus",
  "type":"prometheus",
  "url":"http://morpheus.alin.be:9090",
  "access":"proxy",
  "isDefault":true,
  "basicAuth":false
}'

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

echo ""
echo ""
echo "Change Password Admin"
echo "----------"

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X PUT $HOST/users/1/ -H "Content-Type: application/json" -X PUT -d '{
  "email":"patrickalin@gmail.com",
  "name":"Patrick Alin",
  "login":"admin",
  "theme":"dark"
}'


curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X PUT $HOST/admin/users/1/password -H "Content-Type: application/json" -X PUT -d '{
"password":"PASSSWORD"}'

echo ""
echo ""
echo "Import Dashboard"
echo "----------"

#curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X GET $HOST/dashboards/db/aaa -H "Content-Type: application/json" -o aaa.json

curl -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/dashboards/db -H "Content-Type: application/json" -d @configuration/originalFASS.json

echo ""
echo ""

