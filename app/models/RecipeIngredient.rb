class RecipeIngredient
  attr_accessor
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredient
    # RecipeIngredient#ingredient should return the ingredient instance
  end

  def recipe
    # RecipeIngredient#recipe should return the recipe instance
  end

end
