#! /bin/bash


START_IDX=7500
MAX_IDX=10000
ITER=$(seq $START_IDX $MAX_IDX)
LANG=ko

mkdir PDFS

for i in $ITER
do
{	
res=$(curl -w '%{http_code}' -s -o /dev/null "https://cdn.intra.42.fr/pdf/pdf/$i/$LANG.subject.pdf") 
if [ $res -eq 200  ]
then
	echo "https://cdn.intra.42.fr/pdf/pdf/$i/$LANG.subject.pdf"
	curl -s "https://cdn.intra.42.fr/pdf/pdf/$i/$LANG.subject.pdf" -o "./PDFS/$LANG$i.pdf"
fi
} &
done

wait
echo "Done!"
