# SQL Server Query with sqlcmd

Using `sqlcmd` to make queries and get results from Linux terminal.

You must install **sqlcmd** to be able to run the shell. (how to)[https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver15].

To run it just add your query to the .sql file and run the .sh file passing the sql file as the parameter: `./my_analysis.sh my_analysis.sql`.

A `result_my_analysis.tsv` file will contain the results of your query.
