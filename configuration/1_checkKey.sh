echo "------------------------"
echo "Test Key"
echo "------------------------"

KEY=eyJrIjoiSnNPS2NHQ3ZzQ2FiM20ycUg1YnpzaVo2Z2psVW01NmwiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoxfQ==
HOST="http://grafana.services.alin.be/api"

curl -k -H "Authorization: Bearer $KEY" $HOST/dashboards/home
echo " "
