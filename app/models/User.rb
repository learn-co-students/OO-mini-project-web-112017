class User

@@all = []

attr_accessor :name, :recipe_card

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(self, recipe, rating)
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe|
    recipe.user == self
    end
  end

  def recipes
    recipe_cards.collect do |recipe_card|
    recipe_card.recipe
  end
  end

  def most_recent_recipe
    recipes.last
  end

  def top_three_recipes
    sorted = self.recipe_cards.sort_by { |recipe_card| -recipe_card.rating}
    sorted[0..2].map { |recipe_card| recipe_card.recipe }
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens_all
    Allergen.all.select do |allergen|
    allergen.user == self
    end
  end

  def allergens
    self.allergens_all.collect do |allergen|
    allergen.ingredient
    end
  end

# def safe_recipies
#   bad_recipes = []
#   allergens = self.allergens
#   recipeIngredients = RecipeIngedient.all
#   recipeIngredients.select do |ri|
#     ri.ingredient.reject do |i|
#     allergens.include?(i)
#     bad_recipes << ri
#     binding.pry
#   end
# end
#   # .collect do |ri|
#   #   ri.recipe
#   # end.uniq
#
# end

end
