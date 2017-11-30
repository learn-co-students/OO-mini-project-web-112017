require_relative '../config/environment.rb'

bob = User.new(name: "Bob")
jim = User.new(name: "Jim")

cake = Recipe.new(title: "Cake")
salad = Recipe.new(title: "Salad")
pizza = Recipe.new(title: "Pizza")
bagel = Recipe.new(title: "Bagel")
muffin = Recipe.new(title: "Muffin")

bob.add_recipe_card(cake, "Today", 5)
bob.add_recipe_card(salad, "Today", 2)
jim.add_recipe_card(pizza, "Today", 3)
bob.add_recipe_card(pizza, "Today", 4)
bob.add_recipe_card(muffin, "Today", 1)

tomato = Ingredient.new(name: "Tomato")
basil = Ingredient.new(name: "Basil")
mushroom = Ingredient.new(name: "Mushroom")

pizza.add_ingredients([tomato, basil, mushroom])
bagel.add_ingredients([tomato, basil, mushroom])

bob.declare_allergen(tomato)
bob.declare_allergen(basil)
jim.declare_allergen(basil)
bob.declare_allergen(basil)
jim.declare_allergen(tomato)

pizza.allergens


binding.pry
