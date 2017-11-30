class Allergen
  attr_accessor :user, :ingredient
  @@all = []

  def initialize (user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

end

# Allergen.all should return all of the Allergen instances
