class RecipeCard
  attr_accessor :recipe, :user, :date, :rating
  @@all = []

  def initialize (recipe, user, date, rating)
    @rating = rating
    @date = date
    @recipe = recipe
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def date
    # RecipeCard#date should return the date of the entry
    self.date
  end

  def rating
    # RecipeCard#rating should return the rating (an integer) a user has given their entry
    self.rating
  end

  def user
    # RecipeCard#user should return the user to which the entry belongs
    self.user
  end

  def recipe
    # RecipeCard#recipe should return the recipe to which the entry belongs
    self.recipe 
  end

end
