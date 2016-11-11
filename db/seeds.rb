require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
result = JSON.parse(ingredients_serialized)

Ingredient.delete_all
result["drinks"].each do |ingredient|
  Ingredient.create(name: "#{ingredient["strIngredient1"]}")
end
