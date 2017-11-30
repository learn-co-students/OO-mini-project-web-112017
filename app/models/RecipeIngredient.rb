class RecipeIngredient

  @@all = []

  attr_reader :recipe, :ingredient

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  #   # should return the ingredient instance
  #   # should return the recipe instance
end
