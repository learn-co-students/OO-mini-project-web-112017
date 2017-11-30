require_relative '../config/environment.rb'

#users
eric = User.new('Eric')
truman = User.new('Truman')
max = User.new('Max')

#recipes
baked_ziti = Recipe.new('Baked Ziti')
tomato_soup = Recipe.new('Tomato Soup')
pizza = Recipe.new('Pizza')
lasagna = Recipe.new('Lasagna')

#ingredients
tomato = Ingredient.new('Tomato')
cheese = Ingredient.new('Cheese')
pasta = Ingredient.new('Pasta')
water = Ingredient.new('Water')
basil = Ingredient.new('Basil')
flour = Ingredient.new('Flour')

#recipe cards
eric.add_recipe_card(baked_ziti, "6/27/2017", 5)
eric.add_recipe_card(lasagna, "6/27/2017", 3)
eric.add_recipe_card(pizza, "6/27/2017", 9)
eric.add_recipe_card(tomato_soup, "6/27/2017", 2)
truman.add_recipe_card(pizza, "7/18/2017", 11)
max.add_recipe_card(baked_ziti, "8/13/2017", 3)



#user allergens
truman.declare_allergen(pasta)
truman.declare_allergen(tomato)
eric.declare_allergen(pasta)
eric.declare_allergen(cheese)
max.declare_allergen(pasta)
max.declare_allergen(tomato)

baked_ziti.add_ingredients([tomato, pasta, cheese, basil])

binding.pry
