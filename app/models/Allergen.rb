class Allergen

  @@all = []
  def self.all
    @@all
  end

  def self.ingredients
    self.all.select do |allergen|
      allergen.ingredient
    end
  end

  attr_accessor :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

end
