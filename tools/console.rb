require_relative "../config/environment.rb"

matt = User.new("matt")
alison = User.new("alison")
avi = User.new("avi")

carrot_cake = Recipe.new("carrot_cake")
pumpkin_pie = Recipe.new("pumpkin_pie")
coffee = Recipe.new("coffee")
ice_cream = Recipe.new("ice_cream")
stir_fry = Recipe.new("stir_fry")


carrot = Ingredient.new("carrot")
flour = Ingredient.new("flour")
egg = Ingredient.new("egg")
pumpkin = Ingredient.new("pumpkin")
sugar = Ingredient.new("sugar")
butter = Ingredient.new("butter")
coffee_beans = Ingredient.new("coffee_beans")
water = Ingredient.new("water")
milk = Ingredient.new("milk")
chocolate = Ingredient.new("chocolate")
rice = Ingredient.new("rice")
veggies = Ingredient.new("veggies")
soy_sauce = Ingredient.new("soy_sauce")

alison_carrot = alison.add_recipe_card(carrot_cake, "2017-11-30", 10)
alison_ice_cream = alison.add_recipe_card(ice_cream, "1917-11-03", 12)

avi_ice_cream = avi.add_recipe_card(ice_cream,"2030-4-12", 8)
avi_fry = avi.add_recipe_card(stir_fry, "2001-12-25", 7)

matt_pumpkin = matt.add_recipe_card(pumpkin_pie, "2017-11-20", 10)
matt_carrot = matt.add_recipe_card(carrot_cake, "2017-11-26", 10)
matt_coffee = matt.add_recipe_card(coffee, "2000-01-11", 6)
#matt_ice_cream = matt.add_recipe_card(ice_cream, "1993-03-24", 9)

carrot_cake_ing = carrot_cake.add_ingredients([carrot,flour,egg,sugar])
pumpkin_pie_ing = pumpkin_pie.add_ingredients([pumpkin,sugar,butter,flour])
coffee_ing = coffee.add_ingredients([coffee_beans,water,milk])
ice_cream_ing = ice_cream.add_ingredients([milk,chocolate,sugar])
stir_fry_ing = stir_fry.add_ingredients([veggies,rice,soy_sauce])

matt_rice = matt.declare_allergen(rice)
avi_milk = avi.declare_allergen(milk)
matt_flour = matt.declare_allergen(flour)
alison_rice = alison.declare_allergen(rice)

example = RecipeIngredient.all[4] #shows recipe ingredient stuff works


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
