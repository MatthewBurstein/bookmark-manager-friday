require 'pg'

task :test_database_setup do

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE links;")

  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com');")
end

task :setup do
  p "Creating databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|

    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEUY, url VARCHAR(60));")
    rescue PG::DuplicateDatabase => error
      p error
      p "#{ database } already exists"
  end
end
