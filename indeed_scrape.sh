CURRENT_FILENAME=may
MYDATE=$(date +"%d_%m_%Y")
MYPATH=/home/ubuntu
COUNTRY=au
cd $MYPATH/$COUNTRY/static/
date >> ./runcounter
date +%d-%m-%Y_%H:%M > date
sleep 5
echo Starting_Scrapy
cd $MYPATH/$COUNTRY/
scrapy crawl Mediapartners-Google -o $MYPATH/$COUNTRY/static/output/$CURRENT_FILENAME.csv
echo $CURRENT_FILENAME > $MYPATH/$COUNTRY/static/output/filename
sleep 10
cd $MYPATH/$COUNTRY/static/output
sudo python deduplicate.py
cd $MYPATH/$COUNTRY/static/output/transfer
gzip *.*
mv *.* /$MYPATH/countries/$COUNTRY
#scp -i $MYPATH/.ssh/aws_schlupfi.pem -r $MYPATH/transfer/$COUNTRY/* ubuntu@54.93.163.4:./countries/$COUNTRY
