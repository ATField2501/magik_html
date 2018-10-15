#!/bin/bash
# -*- coding: utf8
# Auteur: Cagliostro <atfield2501@gmail.com>
# Script générateur de squelette de page html.

nb=0

Fonction_ecriture(){
    text='<!DOCTYPE html>
          <html lang="fr"
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
    echo "$text" > squelette-$nb.html

}


if [ $# = 0 ]
then
    Fonction_ecriture
elif [ $1 = -h ]                                    
then
    echo '* Générateur de squelette de page html'
    echo '* Passez en paramètre le nombre de page à générer'
else
    while [ $nb -ne $1 ]
    do
        Fonction_ecriture
    let nb+=1
    done
fi
