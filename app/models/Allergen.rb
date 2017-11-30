class allergen
  attr_accessor
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end

# Allergen.all should return all of the Allergen instances
