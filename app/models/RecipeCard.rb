class RecipeCard

  @@all = []
  attr_reader :user, :recipe, :date, :rating

  def initialize(user,recipe,date,rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end

  def self.all
    @@all
  end
  #   #should return the date of the entry
  #   # should return the rating (an integer) a user has given their entry
  #   #should return the user to which the entry belongs
  #   #should return the recipe to which the entry belongs
end
