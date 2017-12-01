class Allergen

  attr_accessor :user, :ingredient, :recipe

  @@all = []

  def initialize(user, ingredient)
    @recipe = recipe
    @user = user
    @ingredient = ingredient
    @@all << self
  end


  def self.all
    @@all
  end
end
