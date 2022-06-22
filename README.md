# README


* Ruby version 2.7.2

* Databse Sqlite3

* Deployment instructions

*  Entrar al Path del proyecto
*  Ejecutar docker: 
*  docker build . -t nexu_challenge:latest
*  docker run -d -p 3000:3000 --name nexu_challenge nexu_challenge:latest 

* Ejecutar Test
* Dentro del path del proyecto
* bundle exec rspec spec/models  (Test Model)
* bundle exec rspec spec/requests ( Test request Brand)