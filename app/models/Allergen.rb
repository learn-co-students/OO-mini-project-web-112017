class Allergen

  attr_accessor :user, :ingredient

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_ingredients
    self.all.collect {|allergen| allergen.ingredient}.uniq
  end 

end
