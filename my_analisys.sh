#!/bin/bash

# set the password and file with the query
PASSWORD='MySecretPass'

# set the ip of the server to connect
SQL_SERVER_IP='10.154.13.18'

# set the database to connect
DB='sql_server_database'

if [ ! -z $1 ]
then
	# query file passed as argument
	QUERY_FILE=$1
else
	# when there's no argument use default .sql file
	QUERY_FILE="my_analisys.sql"
fi

# output file name is composed by the name of the .sql file
OUTPUT_FILE="result_${QUERY_FILE%%.*}.tsv"

echo -e "Start:\t$(date '+%A %W %Y %X')"

# execute query and return the values separated by TAB
sqlcmd -S ${SQL_SERVER_IP} -U ${DB} -P ${PASSWORD} -i ${QUERY_FILE} -o ${OUTPUT_FILE} -s"	"

echo "Finished query."
echo "Cleaning the results..."

# clean and format the output file
sed -i -r "s/ +/ /g" ${OUTPUT_FILE}
sed -i -e "2d;$ d" ${OUTPUT_FILE} 
sed -i -r "s/ \t/\t/g" ${OUTPUT_FILE}
sed -i -r "s/\t /\t/g" ${OUTPUT_FILE} 
sed -i -r "s/^ +//" ${OUTPUT_FILE}
sed -i -r "s/ +$//" ${OUTPUT_FILE}

echo -e "Finished:\t$(date '+%A %W %Y %X')"
