class User
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
    # RecipeCard.all.collect do |recipecard|
    #   recipecard.user
    # end.uniq
  end

  def recipe_cards
    RecipeCard.all.select do |recipecard|
      recipecard.user == self
    end
  end

  def recipes
    # should return all of the recipes this user has recipe cards for
    self.recipe_cards.collect {|recipecard| recipecard.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    # should accept a recipe instance as an argument, as well as a date and rating
    # and create a new recipe card for this user and the given recipe
    RecipeCard.new(self,recipe, date, rating)
  end

  def declare_allergen(ingredient)
    #should accept an ingredient instance as an argument, and create a new allergen
    # instance for this user and the given ingredient
    Allergen.new(self, ingredient)
  end

  def allergens
    #should return all of the ingredients this user is allergic to
    Allergen.all.select do |allergen|
      allergen.user == self
    end.collect {|allergen| allergen.ingredient}
  end

  def top_three_recipes
    #should return the top three highest rated recipes for this user
    top = self.recipe_cards.sort_by {|recipecard| recipecard.rating}
    if top.length < 3
      top.collect {|recipecard| recipecard.recipe}.reverse
    else
      top_three = top[-3..-1]
      top_three.collect {|recipecard| recipecard.recipe}.reverse
    end
  end

  def most_recent_recipe
    # should return the recipe most recently added to the user's cookbook
    self.recipe_cards.sort_by {|recipecard| recipecard.date}.last.recipe
  end

  def save_recipes #bonus
    # return all recipes that do not contain ingredients the user is allergic to
    self.recipes.reject do |recipe|
      recipe.ingredients.any? do |ingredient|
        self.allergens.include?(ingredient)
      end
    end
  end
end
