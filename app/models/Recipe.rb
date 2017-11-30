class Recipe
  attr_accessor :ingredients
  @@all = []

  def initialize (ingredients)
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

  def most_popular
    # Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards) should return all of the recipe instances
  end

  def users
    # Recipe#users should return the user instances who have recipe cards with this recipe
  end

  def ingredients
    # Recipe#ingredients should return all of the ingredients in this recipe
  end

  def allergens
  # Recipe#allergens should return all of the ingredients in this recipe that are allergens
  end

  def add_ingredients(arr)
  # Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  end

end
