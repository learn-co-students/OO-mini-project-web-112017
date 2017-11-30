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
    recipes = RecipeCard.all.collect{|recipeCard| recipeCard.recipe}
    unique_recipes = recipes.uniq
    unique_recipes.collect do |uniqRecipe|
      recipes.count(uniqRecipe)
    end.sort.last
  end

  def users
    instance = RecipeCard.all.select {|card| card.recipe == self }
    instance.map {|item| item.user }
  end

  def allergens
    ingredients = RecipeIngredient.all.select {|lists| lists.recipe == self}
    Allergen.all.each do |allergy|
      ingredients.map do |ing|
        allergy == ing
      end
    end
  end

  def add_ingredients(arr)
    arr.each do |ing|
      RecipeIngredient.new(self, ing)
    end
  end

end
