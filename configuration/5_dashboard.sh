KEY=eyJrIjoiSnNPS2NHQ3ZzQ2FiM20ycUg1YnpzaVo2Z2psVW01NmwiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoxfQ==
HOST="http://grafana.services.alin.be/api"

echo ""
echo ""
echo "------------------------"
echo "Import Dashboard"
echo "------------------------"

#curl -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X GET $HOST/dashboards/db/original-open-faas-dashboard -H "Content-Type: application/json" -o @dashboard/export.json

echo " "
echo "Import FAAS"
curl -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/dashboards/db -H "Content-Type: application/json" -d @dashboard/originalFASS.json

echo " "
echo " " 
echo "Import docker"
curl -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $KEY" -X POST $HOST/dashboards/db -H "Content-Type: application/json" -d @dashboard/docker.json

echo ""
echo ""
echo "------------------------"

#Prendre le dashboard from internet and change :
#"name": "DS_FAAS",           --->       "name": "faasPrometheus",
#"datasource": "${DS_FAAS}",  ---> "datasource": "faasPrometheus",
#   at the begin            ---> {      "dashboard": {
#      a the   end                     --->  "overwrite": true }
#
# vi : %s/${DS_PROMETHEUS}/prometheus/g
