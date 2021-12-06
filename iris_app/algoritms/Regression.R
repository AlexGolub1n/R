library(installr)
library(RSQLite)
library(DBI)
library(jsonlite)
library(plumber)

#Подключение к базе данных
con <- dbConnect(RSQLite:: SQLite(), "/db")

#Чтение таблицы из базы данных
table <- dbReadTable(con, "Data_iris")


#тут должен быть код


#Отключение от базы данных
dbDisconnect(con)
