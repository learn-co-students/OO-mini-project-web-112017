class RecipeCard
  attr_accessor
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def date
    # RecipeCard#date should return the date of the entry
  end

  def rating
    # RecipeCard#rating should return the rating (an integer) a user has given their entry
  end

  def user
    # RecipeCard#user should return the user to which the entry belongs
  end

  def recipe
    # RecipeCard#recipe should return the recipe to which the entry belongs
  end

end
