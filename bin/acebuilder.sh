#!/bin/bash
# Script to create an Ace file for an eglade generared project.
# author: Didier CLERC <didier-clerc@isuisse.com>

cat=$(which cat)
tr=$(which tr)
function create_ace(){
	echo system > Ace.se.ace
	echo "" >> Ace.se.ace
	echo "	"$system_name>> Ace.se.ace
	echo "" >> Ace.se.ace
	echo "root" >> Ace.se.ace
	echo "">> Ace.se.ace
	echo "	"$( echo $1 | $tr '[:lower:]' '[:upper:]'  )":"$2 >> Ace.se.ace
	$cat ${EGTK}/begin_universal_ace >> Ace.se.ace
	if [ -f ./custom_ace ]; then 
		$cat ./custom_ace >> Ace.se.ace; 
	else
		cp $EGTK/custom_ace .
	fi
	$cat ${EGTK}/end_universal_ace >> Ace.se.ace

}

function error(){
	echo "$0 <root_class> [ <root_feature> ] [ <system_name>]" 
	echo "<root_class> must be without .e extension"
	echo "<root_feature> by default: make"
	echo "<system_name> by default : <root_class> in lowercase"
	echo "If there is a file named './custom_ace', it will be add to 'Ace.se.ace'."
	echo "'custom_ace' will contain specific additional clusters."
}

function lowercase_sysname(){
	system_name=$(echo $system_name | $tr '[:upper:]' '[:lower:]' ) 
}

function check_ace () {

	if [ -s ${EGTK}/begin_universal_ace ] && [ -r ${EGTK}/begin_universal_ace ] ;then
		if [ -s ${EGTK}/end_universal_ace ] && [ -r ${EGTK}/end_universal_ace ] ; then
			if [ -s ${EGTK}/custom_ace ] && [ -r ${EGTK}/custom_ace ] ; then
				return 0
			else
				echo "You should have ${EGTK}/custom_ace"
				return 1
			fi
		else
			echo "You should have ${EGTK}/end_universal_ace"
			return 1
		fi
	else
		echo "You should have ${EGTK}/begin_universal_ace"
		return 1
	fi
}
if check_ace ; then
 case "$#" in 
	0 )	error;;
	1 ) 	system_name=$1
		lowercase_sysname
		create_ace $1 "make"
		compile Ace.se.ace;;
	2 )	system_name=$1
		lowercase_sysname
		create_ace $1 $2
		compile Ace.se.ace;;
	3 )	system_name=$3
		create_ace $1 $2
		compile Ace.se.ace;;
	* )	error;;
 esac
fi
