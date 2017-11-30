class User
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    #should return all of the recipes this user has RECIPE CARDS for
    RecipeCard.all.select { |recipe_card| recipe_card.user == self }.map { |rc| rc.recipe }
  end

  def add_recipe_card(recipe, date, rating)
    #should accept a recipe instance as an argument,
    #as well as a date and rating,
    #and create a new recipe card for this user and the given recipe
    RecipeCard.new(recipe, date, rating, self)
  end

  def declare_allergen(ingredient)
    # should accept an ingredient instance as an argument,
    #and create a new allergen instance for this user and the given ingredient
    Allergen.new(ingredient, self)
  end

  def allergens
    #should return all of the ingredients this user is allergic to
    Allergen.all.select { |allergen| allergen.user == self }.map { |allergen| allergen.ingredient }
  end

  def top_three_recipes
    #should return the top three highest rated recipes for this user.
    RecipeCard.all.select { |recipe_card| recipe_card.user == self }.sort_by { |rc| rc.rating }.reverse.first(3)
  end

  def most_recent_recipe
    #should return the recipe most recently added to the user's cookbook.
    RecipeCard.all.select { |recipe_card| recipe_card.user == self }.map { |rc| rc.recipe }.last
  end
end
