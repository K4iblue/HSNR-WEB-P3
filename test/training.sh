curl 'http://127.0.0.1:8080/api/training/update' \
  -D - \
  --fail \
  -H 'Content-Type: application/json' \
  --data-binary '{"id":"1","title":"Professionelles Nix Tun","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et urna sodales nisi varius varius. Maecenas ipsum mauris, bibendum in molestie vitae, pharetra in eros.","date_from":"2020-12-10","date_to":"2020-12-11","max_participants":"5","min_participants":"2","certificate_id":"1"}'

curl 'http://127.0.0.1:8080/api/training/insert' \
  -D - \
  --fail \
  -H 'Content-Type: application/json' \
  --data-binary '{"title":"Test","desc":"Test","date_from":"2021-01-20","date_to":"2021-01-28","min_participants":"1","max_participants":"3","certificate_id":"1"}'

curl 'http://127.0.0.1:8080/api/training/add-qualification' \
  -D - \
  --fail \
  -H 'Content-Type: application/json' \
  --data-binary '{"training_id":"1","qualification_id":"1"}'

curl 'http://127.0.0.1:8080/api/training/remove-qualification/1/1' \
  -D - \
  --fail \
  -H 'Content-Type: application/json' \

curl 'http://127.0.0.1:8080/api/training/delete/42' \
  -D - \
  --fail \
