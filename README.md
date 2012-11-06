Umbraco Snippets
________________

Some code that might be usefull for other people.


Use the SQL below to generate files in SSMS to insert the data in another Umbraco database

- sp_geneate_inserts_vyaskn.sql
  Stored procedure to create the INESRT statements
  Creates a system sp 

- alter_collation_umb4.7.sql
  Change COLLATION on 4.7 database from Danish_Norwegian to database_default
  Umbraco 4.7 has some strange Danish collation set which will prevent export/backup scripts to run.
  Use this script first to fix the collation.

- export-umbraco-data.sql
  Run sp on all tables to generate INSERTS statements for the Umbraco data
  Set output of SSMS to file.

