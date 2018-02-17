KEY=eyJrIjoiSnNPS2NHQ3ZzQ2FiM20ycUg1YnpzaVo2Z2psVW01NmwiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoxfQ==
HOST="http://grafana.services.alin.be/api"

echo ""
echo ""
echo "------------------------"
echo "Change Password Admin"
echo "------------------------"

curl -X GET -H "Content-Type: application/json" http://admin:secret@grafana.services.alin.be/api/users?perpage=10&page=1

echo " "

curl -H "Content-Type: application/json" -X PUT http://admin:secret@grafana.services.alin.be/api/users/1/ -H "Content-Type: application/json" -X PUT -d '{
  "email":"patrickalin@gmail.com",
  "name":"Patrick Alin",
  "login":"admin",
  "theme":"dark"
}'

echo " "

curl -H "Content-Type: application/json" -X PUT http://admin:secret@grafana.services.alin.be/api/users/password -H "Content-Type: application/json" -X PUT -d '{
 "oldPassword": "secret", "PASSWORD": "new_password","password":"PASSWORD"}'


echo " "
