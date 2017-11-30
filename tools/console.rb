require_relative '../config/environment.rb'

sally = User.new("Sally")
gustave = User.new("Gustave")
hiro = User.new("Hiro")

flour = Ingredients.new("flour")
eggs = Ingredients.new("eggs")
milk = Ingredients.new("milk")
yeast = Ingredients.new("yeast")
chicken = Ingredients.new("chicken")
noodles = Ingredients.new("noodles")
broth = Ingredients.new("broth")
carrots = Ingredients.new("carrots")
spices = Ingredients.new('spices')
casein = Ingredients.new('casein')
rennet = Ingredients.new('rennet')
beef = Ingredients.new('beef')
butter = Ingredients.new("butter")


bread = Recipe.new("Bread")
bread.add_ingredients([flour,eggs,milk,yeast])

chicken_soup = Recipe.new("Chicken Noodle Soup")
chicken_soup.add_ingredients([chicken,noodles,broth,carrots,spices])

cheese = Recipe.new("Cheese")
cheese.add_ingredients([milk,casein,rennet,spices])

steak = Recipe.new("Steak")
steak.add_ingredients([beef,butter,spices])


sally_recipe = RecipeCard.new(bread, sally, "11/1/68", 4)
gustave_recipe = RecipeCard.new(chicken_soup, gustave, "2/14/98", 5)
hiro_recipe = RecipeCard.new(cheese, hiro, "8/20/17", 3)
sally_recipe2 = RecipeCard.new(steak, sally, "4/20/17", 5)
sally_recipe3 = RecipeCard.new(cheese, sally, "3/2/93", 1)
sally_recipe4 = RecipeCard.new(chicken_soup, sally, "1/20/17", 2)


binding.pry
