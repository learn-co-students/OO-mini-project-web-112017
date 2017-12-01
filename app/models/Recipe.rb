class Recipe

attr_accessor :name

@@all = []

def initialize(name)
  @name = name
  @@all << self
end

def self.all
  @@all
end

def recipe_cards
  RecipeCard.all.select do |recipe_card|
    recipe_card.recipe == self
  end
end

def users
  recipe_cards.collect do |recipe_card|
    recipe_card.user
  end
end

def self.all_users_recipes
  RecipeCard.all.map do |recipe_card|
  recipe_card.recipe
  end
end

def self.most_popular
  arr = Recipe.all_users_recipes
  freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  arr.max_by { |v| freq[v] }
end

def add_ingredients(array)
  array.map do |ingredient|
    RecipeIngedient.new(self, ingredient)
  end
end

def ingredients
   RecipeIngedient.all.select do |recipe_ingredient|
    recipe_ingredient.recipe == self
  end.map do |recipe_ingredient|
    recipe_ingredient.ingredient
  end
end

def allergens
  ingredients = self.ingredients
  allergens = Allergen.all.map do |allergen|
    allergen.ingredient
  end
  ingredients.select do |ingredient|
    ingredient if allergens.include?(ingredient)
  end
end

end