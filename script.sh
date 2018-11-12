#!/bin/bash

# para rodar ./script.sh  "Palavra chave"

rm templinks templinks2 2>/dev/null >/dev/null
touch templinks
touch templinks2

extrai() {
#   EXTRAIR OS LINKS DO SITE | templinks
  links="$(curl -s "https://pastebin.com/archive" | grep "i_p0" | cut -d"=" -f5 | cut -d'"' -f2 | tr -d "/")"
  sleep 2
  for l in $links; do
    r=$(grep "$l" templinks)
    if [ "$r" == "" ]; then echo $l >> templinks; fi
  done
}

acessa() {
  #   ACESSAR OS LINKS E FILTRAR OS QUE CONTÉM A "PALAVRA CHAVE"
  for r in $1; do
    echo "$r" >> templinks2
    r2="$(curl -s "https://pastebin.com/raw/$r" | grep "$2")"; 
    if [ "$r2" != "" ]; then echo "https://pastebin.com/raw/$r"; fi; 
    sleep 2
  done
}

[ "$1" == "" ] && { clear; echo "[+] Use: $0 \"string\""; exit; }
clear
echo "[+] Monitorando: \"$1\" em pastebin.com"
echo
while :; do
  extrai
  links="$(diff templinks templinks2 | cut -d" " -f2 | grep -v ",")"
  acessa "$links" "$1"
  sleep 3
done