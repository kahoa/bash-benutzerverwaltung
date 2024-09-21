#!/bin/bash
echo "Hello, World!"

if [ $# -eq 0 ];then
	read -p "wie heisst du?: " username
elif [ $# -eq 1 ] ;then
	username=$1

	else
	echo "Fehler!: zu viele Argumente."
	exit 1
fi
echo "Hallo, $username! Willkommen zum Benutzerverwaltungsskript."

read -p "Waele eine Option:
1.Benutzer hinzufuegen
2.Benutzer anzeigen
3.Benutzer bearbeiten
4.Benutzer loeschen
: " nummer



if [ $nummer -eq 1 ];then
	read -p "Gib den Namen des neuen Benutzer ein:  " name
	read -p "Gib die E-mail des neuen Benutzer ein: " email
	echo "$name $email" >> user.txt
	echo "dein Name und deine E-mail adresse im user.txt gespeichrt"

elif [ $nummer -eq 2 ];then
	if [ -f user.txt ];then
		echo "Liste der Benutzer: "
		cat user.txt
	fi
elif [ $nummer -eq 3 ];then
	read -p "Gib den Namen des zu bearbeitenden Benutzers ein: " bearbeitenden_Benutzers
	# if [[ $bearbeitenden_Benutzers == "Jonas" ]] ;then	 
	read -p "Gib den neuen Namen des Benutzers ein: " neue_Benutzer
	read -p "Gib die neue E-mail des Benutzers ein: " neue_email
	# Pruefung, ob Benutzer imn useer.txt existiert
	bearbeitenden_Benutzers_such=$(cat user.txt | grep "$bearbeitenden_Benutzers")
	if [ ! -z "$bearbeitenden_Benutzers_such" ];then
		# Benutzer in Datei user.txt editieren, nicht einfach neu anhaengen
		sed -i "s/^$bearbeitenden_Benutzers .*/$neue_Benutzer $neue_email/" user.txt 	
		# elif [[ $bearbeitenden_Benutzers != "Jonas" ]];then
		else
		# Wenn Benutzer nicht extiert
		echo "deine Name extiert nicht in der Liste"
	fi

elif [ $nummer -eq 4 ];then
	read -p  "Gib einen Benutzername ein, den du loeschen moechtest:  " name
	 if [ -e user.txt ];then
		if grep -q "$name" user.txt;then
			sed -i "/^$name/d" user.txt
         		echo "Der Benutzername "$name" wurde aus der Datei geloescht."
		else
			echo "Der Benutzername "$name" wurde in der Datei nicht gefunden."
		
		fi
 	else 
		echo "Die Datei 'user.txt' existiert nicht."
	fi


else
	echo "Fehler!:ungueltig Option."
fi

