require_relative '../config/environment.rb'


apple_pie = Recipe.new("Apple Pie")
fries = Recipe.new("French Fries")
beef = Recipe.new("Steak")
icecream = Recipe.new("Ice Cream")
lindsay = User.new("lindsay")
sam = User.new("Sam")
lindsay.add_recipe_card(apple_pie, 3)
garry = User.new("Garry")
lindsay.add_recipe_card(beef, 2)
sam.add_recipe_card(beef, 3)
garry.add_recipe_card(apple_pie, 2)
garry.add_recipe_card(fries, 3)
garry.add_recipe_card(beef, 5)
garry.add_recipe_card(icecream, 4)

test1 = garry.top_three_recipes
# test1 = Recipe.recipe_names
# test2 = Recipe.find_max

salt = Ingredients.new("salt")
flour = Ingredients.new("flour")
butter = Ingredients.new("butter")
sugar = Ingredients.new("sugar")
apples = Ingredients.new("apples")
cream = Ingredients.new("Cream")

pepper = Ingredients.new("Pepper")
broth = Ingredients.new("broth")

array = [salt, flour, butter, sugar]
array2 = [apples, cream]
apple_pie.add_ingredients(array)
beef.add_ingredients([pepper, broth])


apple_pie.add_ingredients(array2)

test3 = apple_pie.ingredients

garry.declare_allergen(apples)
garry.declare_allergen(cream)
lindsay.declare_allergen(apples)
lindsay.declare_allergen(flour)


apple_pie.allergens


garry.safe_recipies

binding.pry
