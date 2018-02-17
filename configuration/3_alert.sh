KEY=eyJrIjoiSnNPS2NHQ3ZzQ2FiM20ycUg1YnpzaVo2Z2psVW01NmwiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoxfQ==
HOST="http://grafana.services.alin.be/api"

echo ""
echo ""
echo "------------------------"
echo "CHANNEL ALERT"
echo "------------------------"

curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/alert-notifications -H "Content-Type: application/json" -X POST -d '{
  "name":"new alert mail",
  "type":"email",
  "isDefault": true,
  "settings": {
    "addresses": "patrickalin@gmail.com"
  }
}'
echo ""
