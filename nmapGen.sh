#!/bin/bash
#Read the Ip Address of The Target Machine
echo "Enter The IP : " 
read ip
#Create a Temporary file to store and validate the Input
fileName="temp"
ping $ip -c4 > $fileName.txt
if grep -q "Unreachable" "$fileName.txt" ; #Check the availability of the IP Addres usin Ping Command
then
	echo "No Host Available"
	rm $fileName.txt
else
	echo -n "" > $fileName.txt
	sudo nmap -sT $ip > $fileName.txt  #Scans The Target
	echo ""
	echo "OPEN Ports :"
	grep -w open "$fileName.txt"  #Displays The Open Ports in the Target
	rm $fileName.txt
fi

