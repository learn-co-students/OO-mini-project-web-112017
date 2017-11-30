class User


  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    self.recipecards.collect {|recipecard| recipecard.recipe}
  end

  def add_recipe_card(recipe, date, rating)
# User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating,
# and create a new recipe card for this user and the given recipe
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
# User#declare_allergen should accept an ingredient instance as an argument,
# and create a new allergen instance for this user and the given ingredient
    Allergen.new(self, ingredient)
  end

  def allergen_cards
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def allergens
# User#allergens should return all of the ingredients this user is allergic to
    self.allergen_cards.collect {|allergen| allergen.ingredient}
  end

  def top_three_recipes
# User#top_three_recipes should return the top three highest rated recipes for this user.
    ranked_recipes = self.recipecards.sort_by {|recipecard| recipecard.rating}

    if ranked_recipes.length > 2
      top_recipes = ranked_recipes[-3..-1]
    elsif ranked_recipes.length > 0
      top_recipes = ranked_recipes
    else
      top_recipes = []
    end

    top_recipes.collect {|recipecard| recipecard.recipe}.reverse
  end

  def most_recent_recipe
# User#most_recent_recipe should return the recipe most recently added to the user's cookbook
    self.recipecards.sort_by {|recipecard| recipecard.date}.last.recipe
  end

  def safe_recipes
    #### BONUS ####
    # should return all recipes that do not contain ingredients the user is allergic to
    self.recipes.reject do |recipe|
      recipe.ingredients.any? do |ingredient|
        self.allergens.include?(ingredient)
      end
    end
  end


end
