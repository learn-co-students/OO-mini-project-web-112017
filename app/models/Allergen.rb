class Allergen

  @@all = []
  attr_reader :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_ingredient
    @@all.collect {|allergen| allergen.ingredient}.uniq
  end
end
