https://database.guide/how-to-install-sql-server-on-a-mac/


sudo docker pull mcr.microsoft.com/mssql/server:2019-latest


docker run -d --name sql_server_demo -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=reallyStrongPwd123' -p 1433:1433 mcr.microsoft.com/mssql/server:2019-latest




