#!/bin/bash
# Skrip uji REST API menggunakan cURL (Tanpa JQ)
BASE="http://localhost:8000/api/books"

echo "== Test 1: GET semua buku =="
curl -s $BASE

echo -e "\n\n== Test 2: POST buku baru =="
curl -s -X POST $BASE \
  -H "Content-Type: application/json" \
  -d '{"judul":"Bumi", "penulis":"Tere Liye", "tahun":2014, "stok":2}'

echo -e "\n\n== Test 3: GET buku ID 1 =="
curl -s $BASE/1

echo -e "\n\n== Test 4: PUT ubah buku ID 1 =="
curl -s -X PUT $BASE/1 \
  -H "Content-Type: application/json" \
  -d '{"judul":"Bumi (Revisi)", "penulis":"Tere Liye", "tahun":2015, "stok":3}'

echo -e "\n\n== Test 5: DELETE buku ID 1 =="
curl -s -X DELETE $BASE/1

echo -e "\n\n== Test 6: Validasi error =="
curl -s -X POST $BASE \
  -H "Content-Type: application/json" \
  -d '{"judul":""}'

echo -e "\n"