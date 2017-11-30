class Allergen
  attr_accessor :user, :ingredient
  @@all = []

  def initialize(user: nil, ingredient: nil)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def self.ingredients
    self.all.map do |inst|
      inst.ingredient
    end
  end

  def self.users
    self.all.map do |inst|
      inst.user
    end
  end
end
