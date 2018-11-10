#!/bin/bash

touch novos-links

# ACESSAR O PASTEBIN
links="$(curl -s "https://pastebin.com/archive" | grep "i_p0" | cut -d"=" -f5 | cut -d'"' -f2 | tr -d "/")"

#   EXTRAIR OS LINKS DAS NOVAS POSTAGENS
for l in $links; do
  r=grep "$l" novos-links
  if [ "$r" == "" ]; then echo $l >> novos-links; fi
done

#   ACESSAR CADA UM DOS LINKS E OBTER CONTEUDO
#     FILTRAR O CONTEUDO QUE EU QUERO
#     EXIBIR O LINK (OU NAO) / SALVAR O LINK
for r in $(cat novos-links); do
  echo "$r" >> links-acessados
  r2="$(curl -s "https://pastebin.com/raw/$a" | grep "public")"; 
  if [ "$r2" != "" ]; then echo "https://pastebin.com/raw/$a"; fi; 
done
