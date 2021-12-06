library(installr)
library(RSQLite)
library(DBI)
library(jsonlite)
library(plumber)

#ѕодключение к базе данных
con <- dbConnect(RSQLite:: SQLite(), "/db")

#чтение таблицы из базы данных
table <- dbReadTable(con, "Data_iris")


#тут должен быть код


#–азрыв соеденинени€ базы данных
dbDisconnect(con)