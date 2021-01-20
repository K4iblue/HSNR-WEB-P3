curl --fail 127.0.0.1:8080/api/qualification/update \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"id":"1","title":"Test","desc":"test"}'
curl --fail 127.0.0.1:8080/api/qualification/insert \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"title":"Test","desc":"test"}'
curl --fail 127.0.0.1:8080/api/employee/delete/42
