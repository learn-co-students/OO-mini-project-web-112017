class RecipeIngredient

  attr_accessor :recipe, :ingredient
  # RecipeIngredient#ingredient should return the ingredient instance
  # RecipeIngredient#recipe should return the recipe instance

  @@all = []

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
  # RecipeIngredient.all should return all of the RecipeIngredient instances


end
