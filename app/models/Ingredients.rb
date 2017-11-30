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
    Allergen.all.each do |allergy|
      allergy.ingredient.uniq.count
    end
  end
  
end
