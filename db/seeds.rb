# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning up ingredients database'
Ingredient.destroy_all
puts 'Ingredients database is clean'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |ingredient|
  ingredient = Ingredient.create(
    name: ingredient['strIngredient1']
  )
  puts "Ingredient #{ingredient.name} is created"
end

puts 'Ingredients database Done!!!'

puts 'Cleaning up cocktails database'
Cocktail.destroy_all
puts 'Cocktails database is clean'

cocktail_names = ['Daiquiri', 'Piña Colada', 'Mai Tai', 'Caipirinha', 'Old Fashioned', 'Manhattan', 'Margarita', 'Cosmopolitan', 'Mojito', 'Martini']

cocktail_names.each do |cocktail|
  cocktail = Cocktail.create(
    name: cocktail
  )
  puts "Cocktail #{cocktail.name} is created"
end

puts 'Cocktails database Done!!!'
