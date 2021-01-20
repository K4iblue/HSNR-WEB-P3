curl --fail 127.0.0.1:8080/api/employee/update \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"id":"1","name":"Test","surname":"Test","degree":"Test","occupation":"Test"}'
curl --fail 127.0.0.1:8080/api/employee/insert \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"name":"Test","surname":"Test","degree":"Test","occupation":"Test"}'
curl --fail 127.0.0.1:8080/api/employee/delete/1