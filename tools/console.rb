require_relative '../config/environment.rb'

matt = User.new("Matt")
johann = User.new("Johann")
cake = Recipe.new("Cake")
apple = Recipe.new("apple")

matt.add_recipe_card(cake, Time.now, 3)
johann.add_recipe_card(apple, Time.now, 6)
johann.add_recipe_card(cake, Time.now, 9)

apple_card = RecipeCard.new(matt, apple, Time.now, 7)

flour = Ingredient.new("flour")
sugar = Ingredient.new("sugar")
milk = Ingredient.new("milk")
peanut = Ingredient.new("peanut")
cake.add_ingredients([flour, sugar, milk, peanut])


matt.declare_allergen(peanut)

binding.pry
