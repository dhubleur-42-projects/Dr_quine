if [ $# -ne 1 ]
then
	echo "Usage: $0 <filename>"
	exit 1
fi

if [ ! -f $1 ]
then
	echo "File $1 does not exist"
	exit 2
fi

if [ ! -r $1 ]
then
	echo "File $1 is not readable"
	exit 3
fi

cp $1 $1.converted

sed -i 's/%/%%/g' $1.converted
sed -i ':a;N;$!ba;s/\n/%2$c/g' $1.converted
sed -i 's/"/%3$c/g' $1.converted