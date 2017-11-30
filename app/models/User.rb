class User
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    # User#recipes should return all of the recipes this user has recipe cards for
    RecipeCard.all.select { |card| card.user == self}
  end

  def add_recipe_card (recipe, date, rating )
    # User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
    RecipeCard.new(recipe,self,date,rating)
  end
  # RecipeCard.new(recipe, user, date, rating)

  def declare_allergen (ingredient)
    # User#declare_allergen should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
    Allergen.new(self,ingredient)
  end

  def allergens
    # User#allergens should return all of the ingredients this user is allergic to
    Allergen.all.select { |allergy| allergy.user == self }
  end

  def top_three_recipes
    # User#top_three_recipes should return the top three highest rated recipes for this user.
      self.recipes.sort_by {|recipe| recipe.rating }.last(3).reverse
  end

  def most_recent_recipe
    # User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
    RecipeCard.all.last.recipe
  end

end
