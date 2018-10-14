#!/bin/bash
# -*- coding: utf8
# Auteur: Cagliostro <atfield2501@gmail.com>
# Script générateur de squelette de page html.

# Evolution : passer un parametre pour le nombre de squelettes à generer.
# Fait par Jus de Patate <yaume@ntymail.com> github:jusdepatate

text='<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>*******</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
			body {
			}
		</style>
	</head>
	<body>
		<p>
		</p>'
echo "$text" > squelette-0.html

echo "Une page a été créée,"

ask () {                        # $1=question $2=options
 # Gros merci a https://stackoverflow.com/a/20817520
    # set REPLY
    # options: x=..|y=..
	while $(true); do
		printf '%s [%s] ' "$1" "$2"
		stty cbreak
		REPLY=$(dd if=/dev/tty bs=1 count=1 2> /dev/null)
		stty -cbreak
		test "$REPLY" != "$(printf '\n')" && printf '\n'
		(
			IFS='|'
			for o in $2; do
				if [ "$REPLY" = "${o%%=*}" ]; then
					printf '\n'
				break
				fi
			done
		) | grep ^ > ~/null && rm ~/null && return
	done
}

ask 'Voulez-vous en faire d autres ?' 'o=oui|n=non'
if [ "$REPLY" = "o" ]; then
	ask 'Combien voulez-vous en faire ?' '1|2|3|4|5|6|7|8|9|10|20|30|40|50|60|70|80|90|100'
	while [ "$REPLY" -ge "1" ]; do
		echo "$text" >> squelette-"$REPLY".html
		REPLY=$["$REPLY"-1]
	done
fi
exit
