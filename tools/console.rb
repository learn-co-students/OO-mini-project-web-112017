require_relative '../config/environment.rb'

matt = User.new("Matt")
alison = User.new("Alison")
avi = User.new("Avi")

carrot_cake = Recipe.new("carrot cake")
pumpkin_pie = Recipe.new("pumpkin pie")
coffee = Recipe.new("coffee")
ice_cream = Recipe.new("ice cream")
stir_fry = Recipe.new("stir fry")

carrot = Ingredient.new("carrot")
flour = Ingredient.new("flour")
egg = Ingredient.new("egg")
pumpkin = Ingredient.new("pumpkin")
sugar = Ingredient.new("sugar")
butter = Ingredient.new("butter")
coffee_beans = Ingredient.new("coffee beans")
water = Ingredient.new("water")
milk = Ingredient.new("milk")
chocolate = Ingredient.new("chocolate")
rice = Ingredient.new("rice")
veggies = Ingredient.new("veggies")
soy_sauce = Ingredient.new("soy sauce")

alison_carrot = alison.add_recipe_card(carrot_cake, "2017-11-30", 10)
alison_ice_cream = alison.add_recipe_card(ice_cream, "1917-11-03", 12)

avi_ice_cream = avi.add_recipe_card(ice_cream, "2012-12-20", 8)
avi_stir_fry = avi.add_recipe_card(stir_fry, "2001-12-25", 7)

matt_pumpkin = matt.add_recipe_card(pumpkin_pie, "2017-11-20", 8)
matt_carrot = matt.add_recipe_card(carrot_cake, "2017-11-26", 10)
matt_coffee = matt.add_recipe_card(coffee, "2010-08-20", 10)
matt_ice_cream = matt.add_recipe_card(ice_cream, "1993-03-24", 9)

carrot_cake_ingred = carrot_cake.add_ingredients([carrot, flour, egg, sugar])
coffee_ingred = coffee.add_ingredients([coffee_beans, water, milk])
pumpkin_pie_ingred = pumpkin_pie.add_ingredients([pumpkin, sugar, butter, flour])
ice_cream_ingred = ice_cream.add_ingredients([milk, chocolate, sugar])
stir_fry_ingred = stir_fry.add_ingredients([veggies, rice, soy_sauce])

matt_rice = matt.declare_allergen(rice)
avi_milk = avi.declare_allergen(milk)
matt_flour = matt.declare_allergen(flour)
alison_rice = alison.declare_allergen(rice)


binding.pry
