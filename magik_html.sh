#!/bin/bash
# -*- coding: utf8
# Original author: Cagliostro <atfield2501@gmail.com>
# 2018 - (c) Cagliostro <atfield2501@gmail.com> github:ATField2501
# 2019 - (c) Jus de Patate_ <jusdepatate@protonmail.com> github:jusdepatate
#
# This script generates html easily for you
# the only argument accepted in this edition is "$filename"
#
# made with VSCodium.

# <3 ascii art in bash
echo "  __  __             _               _     _             _  "
echo " |  \/  |           (_)             | |   | |           | | "
echo " | \  / | __ _  __ _ _  ___         | |__ | |_ _ __ ___ | | "
echo " | |\/| |/ _\` |/ _\` | |/ __|        | '_ \| __| '_ \` _ \| | "
echo " | |  | | (_| | (_| | | (__         | | | | |_| | | | | | | "
echo " |_|  |_|\__,_|\__, |_|\___| ______ |_| |_|\__|_| |_| |_|_| "
echo "                __/ |       |______|                      "
echo "               |____/ "
echo "  made by Cagliostro & forked by Jus de Patate_"

main() {
	echo -e "\n"

	echo "Choose a language (ISO 639-1)"
	read lang

	echo "Choose a title"
	read title

	echo "Choose a basic text to begin"
	read text

	if [ -n "$1" ]; then
		echo "you passed filename as argument, no need to ask it"
		filename="$1.html"
	else
		echo "Choose filename (w/o .html)"
		read filename
		filename="$filename.html"
	fi

	# basic HTML content
	content="<!DOCTYPE html>
<html lang=\"$lang\">
<head>
	<title>$title</title>
	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">
</head>
<body>
	<h1>$title</h1>
	<p>
		$text
	</p>
</body>
</html>"
	touch "$filename"
	echo "$content" > "$filename"

	echo "$filename has been created"

	echo "Do you need more ?"
	read yesno

	# basic yes/no test
	if [[ "$yesno" = "yes" || "$yesno" = "y" ]]; then
		main
	else
		echo "Goodbye!"
		exit 0
	fi
}

# is the working directory writeable ?
if [ -w ./ ]; then
		# is there an argument ?
		if [ -n $1 ]; then
			main $1
		else
			main
		fi
else
	echo "magik_html can't write in this folder, please change permissions"
	exit 1
fi