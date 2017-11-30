require_relative '../config/environment.rb'

bob = User.new("Bob")
joe = User.new("Joe")
tim = User.new("Tim")
jeff = User.new("Jeff")
jill = User.new("Jill")
tammy = User.new("Tammy")
leslie = User.new("Leslie")

salad = Recipe.new("Salad")
soup = Recipe.new("Soup")
sandwich = Recipe.new("Sandwich")
pizza = Recipe.new("Pizza")
dessert = Recipe.new("Dessert")

tomato = Ingredient.new("tomato")
basil = Ingredient.new("basil")
cheese = Ingredient.new("cheese")

a1 = [tomato, basil, cheese]
a2 = [tomato, cheese]
a3 = [tomato]
pizza.add_ingredients(a1)
sandwich.add_ingredients(a2)
salad.add_ingredients(a3)

bob.add_recipe_card(salad, "11/30", 5)
bob.add_recipe_card(dessert, "11/30", 1)
bob.add_recipe_card(pizza, "11/29", 4)
joe.add_recipe_card(soup, "11/29", 4)
bob.add_recipe_card(sandwich, "11/24", 3)
tim.add_recipe_card(pizza, "11/25", 2)
jill.add_recipe_card(dessert, "11/26", 1)
tammy.add_recipe_card(dessert, "11/27", 1)
leslie.add_recipe_card(dessert, "11/22", 1)
jeff.add_recipe_card(dessert, "11/21", 1)


bob.declare_allergen(basil)
jill.declare_allergen(cheese)
tammy.declare_allergen(tomato)

binding.pry
