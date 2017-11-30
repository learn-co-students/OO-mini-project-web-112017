class RecipeCard

  @@all = []

  def self.all
    @@all
  end

  def self.users
    self.all.map do |recipe_card|
      recipe_card.user
    end
  end

  def self.recipes
    self.all.map do |recipe_card|
      recipe_card.recipe
    end
  end

  attr_accessor  :user, :recipe, :date, :rating

  def initialize(user, recipe, date, rating=nil)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end


end
