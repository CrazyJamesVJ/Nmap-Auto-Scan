echo "Enter The IP : "
read ip
fileName="temp"
ping $ip -c4 > $fileName.txt
if grep -q "Unreachable" "$fileName.txt" ;
then
	echo "No Host Available"
	rm $fileName.txt
else
	echo -n "" > $fileName.txt
	sudo nmap -sT $ip > $fileName.txt
	echo ""
	echo "OPEN Ports :"
	grep -w open "$fileName.txt"
	rm $fileName.txt
fi

