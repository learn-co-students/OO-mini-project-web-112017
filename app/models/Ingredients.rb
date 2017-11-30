class Ingredients
  attr_accessor
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def most_common_allergen
    # Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
  end
end
