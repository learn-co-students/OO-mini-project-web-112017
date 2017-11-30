require 'set'

class Recipe
  attr_reader :name
  @@all = []

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def most_popular
    # should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
    recipes = RecipeCard.all.collect{|recipeCard| recipeCard.recipe}
    unique_recipes = recipes.uniq
    unique_recipes.collect do |uniqRecipe|
      recipes.count(uniqRecipe)
    end.sort.last
  end

  def users
    # Recipe#users should return the user instances who have recipe cards with this recipe
    instance = RecipeCard.all.select {|card| card.recipe == self }
    instance.map {|item| item.user }
  end


  def allergens
  # Recipe#allergens should return all of the ingredients in this recipe that are allergens
    allergen_set = Allergen.all.select {|allergy| allergy.ingredient }.to_set

    ingredient_set = RecipeIngredient.all.select{|rcping| rcping.recipe == self}.collect{|thing| thing.ingredient}.to_set
    #ingredient_set = self.RecipeIngredient.all.to_set

    allergen_set.intersection(ingredient_set)
      #any ingredient in self.ingredients
      #return all of those that match
  end

  def add_ingredients(arr)
  # Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    arr.each do |ing|
      RecipeIngredient.new(self, ing)
    end
  end

end
