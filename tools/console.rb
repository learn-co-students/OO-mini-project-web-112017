require_relative '../config/environment.rb'

#users
david = User.new("David")
yamuna = User.new("Yamuna")

#recipes
pbandj = Recipe.new("Peanut Butter and Jelly")
macncheese = Recipe.new("Mac n Cheese")
pizza = Recipe.new("Pizza")
nuggets = Recipe.new("Nuggets")

recipe1= RecipeCard.new(david, pbandj, "2017-04-10", 4)
recipeC2 = RecipeCard.new(david, pizza, "2017-06-13", 5)
recipeCar232d = RecipeCard.new(david, macncheese, "2015-04-10", 2)
recipeCa232rd = RecipeCard.new(david, nuggets, "2016-06-10", 10)
reci34peCard = RecipeCard.new(david, pbandj, "2013-09-10", 4)
recipeC34ard = RecipeCard.new(david, pizza, "2017-06-13", 5)
rec23ipeCard = RecipeCard.new(david, pizza, "2017-06-13", 5)
recipeCa232rd = RecipeCard.new(david, pizza, "2017-06-13", 5)
recipeCa232rdd = RecipeCard.new(yamuna, pizza, "2017-06-13", 5)


#ingredients
pb = Ingredient.new("Peanut Butter")
cheese = Ingredient.new("Cheese")
sauce = Ingredient.new("Sauce")
chicken = Ingredient.new("chicken")

pbandj.users
yamuna.declare_allergen(pb)
yamuna.declare_allergen(cheese)
david.declare_allergen(cheese)
david.declare_allergen(sauce)
david.declare_allergen(pb)

#adding ingredients to recipe
pizza.add_ingredients([cheese, sauce])



binding.pry
