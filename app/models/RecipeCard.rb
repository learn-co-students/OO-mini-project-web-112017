class RecipeCard
  attr_reader :user, :date, :rating, :recipe
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

end
