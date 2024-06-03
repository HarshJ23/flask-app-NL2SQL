
# Chat with tabular(SQL) database
A flask-based app using OpenAI API , Langchain and SQLAlchemy to query a SQL-based database from natural language.

The SQL Database is hosted on Azure SQL server.

## Approach :

1) Convert user's natural language query into a SQL query using GPT-3.5-Turbo API.

2) Using SQL query , interact with the database through SQLAlchemy.

3) Get output from executed SQL query

4) Return final natural language output along with SQL query output using GPT-3.5-Turbo API.


From langchain documentation:
![App Screenshot](https://python.langchain.com/v0.1/assets/images/sql_usecase-d432701261f05ab69b38576093718cf3.png)



Please check the following link for Frontend code:
[Frontend code repo](https://github.com/HarshJ23/chat-SQL_db-frontend)

## Conclusion
If you think this repo helped you , make sure to star this repository !
