echo "Test Key"
echo "----------"

KEY=nB0RWlCaTJvRWJBcDJXZDU4QWk0UEdVcksiLCJuIjoiZG9ja2VyIiwiaWQiOjF9
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
echo "Change Password Admin"
echo "----------"

#curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X GET $HOST/dashboards/db/spf-etcs-fod-waso -H "Content-Type: application/json" -o dashboards.json

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/dashboards/db -H "Content-Type: application/json" -d @dashboards.json
