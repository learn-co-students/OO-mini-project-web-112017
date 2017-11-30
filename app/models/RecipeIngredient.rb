class RecipeIngredient
  @@all = []
  attr_accessor :recipe, :ingredient

  def initialize(recipe: nil, ingredient: nil)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.recipes
    self.all.map do |inst|
      inst.recipe
    end
  end

  def self.ingredients
    self.all.map do |inst|
      inst.ingredient
    end
  end

end
