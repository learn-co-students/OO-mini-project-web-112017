class RecipeCard
  attr_accessor :date, :rating, :user, :recipe
  @@all = []

  def self.all
    @@all
  end

  def self.users
    self.all.map do |inst|
      inst.user
    end
  end

  def self.recipes
    self.all.map do |inst|
      inst.recipe
    end
  end

  def initialize(user:, recipe:, date:, rating: nil)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end


end
