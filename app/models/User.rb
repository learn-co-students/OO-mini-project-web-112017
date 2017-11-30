class User

  extend Deletable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    #access from recipecard class
    find_helper(RecipeCard.all).collect {|card| card.recipe }

  end

  def add_recipe_card(recipe, date, rating)
    #creates a new recipe card
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    #creates a new allergen instance
    Allergen.new(self, ingredient)
  end

  def allergens
    #access user's allergens from allergen class, returns ingredients
    find_helper(Allergen.all).collect {|allergen| allergen.ingredient}
  end

  def find_helper(some_class)
    some_class.select do |instance|
      instance.user == self
    end
  end


  def top_three_recipes
    #retuns 3 highest rated recipes for the user
    all_recipecards = RecipeCard.all.select {|recipecard|
      recipecard.user == self}

    all_recipecards.sort{|x,y| y.rating <=> x.rating}[0..2]

  end

  def most_recent_recipe
    #returns most recipe that was added for that user

    all_recipecards = RecipeCard.all.select {|recipecard|
      recipecard.user == self}

    all_recipecards.sort{|x,y| y.date <=> x.date}.first
  end

  def safe_recipes

    Recipe.all.select do |recipe|
      (recipe.ingredients & self.allergens).empty?
      # binding.pry
    end
  end

  def self.delete(user)

    #delete allergens
    delete_helper(Allergen.all, user)

    # #delete recipecards
    delete_helper(RecipeCard.all, user)

    User.all.delete(user)

  end



end
