curl 'http://127.0.0.1:8080/api/training/update' \
  -D - \
  -H 'Content-Type: application/json' \
  --data-binary '{"id":"1","title":"Professionelles Nix Tun","desc":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et urna sodales nisi varius varius. Maecenas ipsum mauris, bibendum in molestie vitae, pharetra in eros.","date_from":"2020-12-10","date_to":"2020-12-11","max_participants":"5","min_participants":"2","certificate_id":"1"}' \
  --compressed
