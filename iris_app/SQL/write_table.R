library(RSQLite)
library(DBI)
library(jsonlite)
library(plumber)

#Полчуение данных из Json
data <- jsonlite::fromJSON(jsontable)

#Подключение к базе данных
con <- dbConnect(RSQLite:: SQLite(), "/db")

#Запись данных в database
dbWriteTable(con, "Data_iris", data)

#Разрыв соеденинения базы данных
dbDisconnect(con)