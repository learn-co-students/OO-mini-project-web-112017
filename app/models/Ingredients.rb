class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name: nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    Allergen.ingredients.max_by {|x| Allergen.ingredients.count(x)}
  end

  def recipe_ingredients
      RecipeIngredient.all.select do |i|
        i.ingredient == self
      end
  end

  def recipes
    self.recipe_ingredients.map do |inst|
      inst.recipe
    end
  end

end
