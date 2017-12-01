class RecipeIngredient


  @@all = []

  attr_accessor :ingredient, :recipe

  def initialize(ingredient, recipe)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end
