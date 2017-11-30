class RecipeCard
  attr_reader :user, :date, :rating, :recipe
  @@all = []
  def initialize(recipe, date, rating, user)
    @recipe = recipe
    @date = date
    @rating = rating
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  # def date
    #should return the date of the entry
  # end

  # def rating
    #should return the rating (an integer) a user has given their entry
  # end

  # def user
    #should return the user to which the entry belongs
  # end

  # def recipe
    #should return the recipe to which the entry belongs
  # end
end
