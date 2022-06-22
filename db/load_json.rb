require 'sqlite3'
require 'json'
require 'set'


db = SQLite3::Database.open 'development.sqlite3'

file = File.read('records.json')

data_hash = JSON.parse(file)

brands = Set.new
brands_dict = {}

data_hash.each do |data|
    brands << data["brand_name"]
end

brands.each do |brand|

    db.execute "INSERT INTO brands (name,created_at,updated_at) VALUES (?,DateTime('now'),DateTime('now'))", brand
    id = db.execute "SELECT last_insert_rowid()"
    brands_dict[brand] = id[0][0]
end

data_hash.each do |data|
    db.execute "INSERT INTO models (name,brand_id,average_price,created_at,updated_at) VALUES (?,?,?,
                                                                                                DateTime('now'),
                                                                                                DateTime('now'))",  data["name"],
                                                                                                brands_dict[data["brand_name"]],
                                                                                                data["average_price"]
end