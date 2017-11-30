class Ingredients
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    # Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
    binding.pry
    Allergen.all.each { |allergy|
      allergy.ingredient.count
    }
  end
end
