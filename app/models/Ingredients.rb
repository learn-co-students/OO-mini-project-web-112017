class Ingredient

  @@all =[]

  def self.all
    @@all
  end

  def self.most_common_allergen
    Allergen.ingredients.max_by do |allergen_object|
      Allergen.ingredients.count(allergen_object)
  end
end

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    a = RecipeIngredient.all.select do |row|
      row.ingredient == self
    end

    a.collect do |row|
      row.recipe
    end
  end

end
