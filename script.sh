#!/bin/bash

touch templinks

# ACESSAR O PASTEBIN
links="$(curl -s "https://pastebin.com/archive" | grep "i_p0" | cut -d"=" -f5 | cut -d'"' -f2 | tr -d "/")"

#   EXTRAIR OS LINKS DAS NOVAS POSTAGENS
for l in $links; do
  r=grep "$l" templinks
  if [ "$r" == "" ]; then echo $l >> templinks; fi
done

#   ACESSAR CADA UM DOS LINKS E OBTER CONTEUDO

#     FILTRAR O CONTEUDO QUE EU QUERO

#     EXIBIR O LINK (OU NAO) / SALVAR O LINK
