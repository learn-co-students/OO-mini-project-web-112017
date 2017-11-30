class Ingredient

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
  # Ingredient.most_common_allergen should return the ingredient instance
  # that the highest number of users are allergic to
    allergen_ingredients = Allergen.all.collect {|allergen| allergen.ingredient}
    allergen_ingredients.map {|ingredient| [allergen_ingredients.count(ingredient), ingredient]} #.max[1]
  end


end
