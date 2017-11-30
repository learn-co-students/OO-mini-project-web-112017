class RecipeIngredient
  attr_accessor :recipe, :ingredient
  @@all = []

  def initialize (recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredient
    # RecipeIngredient#ingredient should return the ingredient instance
    self.ingredient
  end

  def recipe
    # RecipeIngredient#recipe should return the recipe instance
    self.recipe
  end

end
