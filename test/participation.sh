curl --fail 127.0.0.1:8080/api/participation/update \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"employee_id":"1","training_id":"1","status":"1"}'
curl --fail 127.0.0.1:8080/api/participation/insert \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"employee_id":"1","training_id":"1","status":"1"}'