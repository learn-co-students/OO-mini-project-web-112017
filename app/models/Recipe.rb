require 'pry'

class Recipe
  attr_accessor :ingredients
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    #should return all of the recipe instances
    @@all
  end

  def self.most_popular
    #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
    recipe_count = RecipeCard.all.inject(Hash.new(hash)) { |recipe_card, count| recipe_card[count] += 1; recipe_card }
    RecipeCard.all.max_by { |count| recipe_count[count] }.recipe
  end

  def users
    RecipeCard.all.select { |card| card.recipe == self }.map { |card| card.user }
    #should return the user instances who have recipe cards with this recipe
  end

  def ingredients
    # should return all of the ingredients in this recipe
    RecipeIngredient.all.select { |ri| ri.recipe == self }.map { |ri| ri.ingredient }
  end

  def allergens
    # binding.pry
    # ingredients.select { |ingredient| ingredient == Allergen.all.each { |allergen| allergen.ingredient } }
    # bad_foods = []
    ingredients.each_with_object([]) do |ingredient, arr|
      Allergen.all.select do |allergen|
         allergen.ingredient == ingredient
       end.each do |allergen|
         arr << allergen.ingredient
       end
      end
    # bad_foods
  end

  def add_ingredients(ingredients_arr)
    #should take an array of ingredient instances as an argument,
    #and associate each of those ingredients with this recipe
    ingredients_arr.each { |ingredient| RecipeIngredient.new(ingredient, self) }
  end
end
