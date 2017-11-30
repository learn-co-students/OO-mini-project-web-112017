class Recipe

  extend Deletable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    #returns all the users of a given recipe
    find_helper(RecipeCard.all).collect {|card| card.user }.uniq

  end

  def ingredients
    #returns all ingredients in recipe
    find_helper(RecipeIngredient.all).collect {|card| card.ingredient }
  end

  def find_helper(recipe_class)
    recipe_class.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def allergens
    #returns all ingredients that are allergens

    allergic_indredients = users.collect do |user|
      user.allergens
    end.flatten


    ingredients.select do |ingredient|
      allergic_indredients.include?(ingredient)
    end

  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def self.all
    @@all
  end

  def self.most_popular

    recipecards = {}
    RecipeCard.all.each do |recipecard|
      if recipecards[recipecard.recipe]
        recipecards[recipecard.recipe] += 1
      else
        recipecards[recipecard.recipe] = 1
      end
    end

    recipecards.select {|recipe, count| count == recipecards.values.max}
  end

  def self.delete(recipe)

    #delete allergens
    delete_helper(RecipeIngredient.all, recipe)

    # #delete recipecards
    delete_helper(RecipeCard.all, recipe)


    Recipe.all.delete(recipe)

  end


end
