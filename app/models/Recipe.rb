class Recipe
  attr_accessor :title
  @@all = []

  def initialize(title: nil)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients(arr)
    arr.each do |x|
      RecipeIngredient.new(recipe: self, ingredient: x)
    end
  end

  def recipe_ingredients
      RecipeIngredient.all.select do |i|
        i.recipe == self
      end
  end

  def ingredients
    self.recipe_ingredients.map do |inst|
      inst.ingredient
    end
  end

  def recipe_cards
    RecipeCard.all.select do |i|
      i.recipe == self
    end
  end

  def self.most_popular
    RecipeCard.recipes.max_by {|x| RecipeCard.recipes.count(x)}
  end

  def users
    self.recipe_cards.map do |x|
      x.user
    end
  end

  def allergens
    arr = []
    self.ingredients.each do |x|
      Allergen.all.each do |y|
        arr << x if x == y.ingredient
      end
    end
    arr.uniq
  end



  # Recipe.all
  # Recipe.most_popular
  # Recipe#users
  # Recipe#allergens
  # Recipe#add_ingredients

end
