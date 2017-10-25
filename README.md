# README
A Simple Admin for petshop

* Starting app
 - docker-compose up --build
 
* Preparing DB with some data and starting fae
docker-compose run --rm app bundle exec rake db:drop db:create db:migrate db:seed fae:seed_db
