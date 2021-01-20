curl --fail 127.0.0.1:8080/api/certificate/update \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"id":"1","title":"Test","desc":"Test","qualifies":"Test"}'
curl --fail 127.0.0.1:8080/api/certificate/insert \
    -D - \
    -H 'Content-Type: application/json' \
    --data-binary '{"title":"Test","desc":"Test","qualifies":"Test"}'
curl --fail 127.0.0.1:8080/api/certificate/delete/1