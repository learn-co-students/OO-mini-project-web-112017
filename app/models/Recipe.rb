class Recipe

  @@all =[]

  def self.all
    @@all
  end

  def self.ingredients
    self.all.map do |recipe_obj|
      recipe_obj.ingredients
    end.flatten
  end

  def self.most_popular
    RecipeCard.recipes.max_by do |recipe_object|
      RecipeCard.recipes.count(recipe_object)
    end
  end

  attr_accessor :title

  def initialize(title)
    @title = title
    @@all << self
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def ingredients
    a = RecipeIngredient.all.select do |row|
      row.recipe == self
    end

    a.collect do |row|
      row.ingredient
    end
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def users
    self.recipe_cards.collect do |recipe_card|
      recipe_card.user
    end
  end

  def allergens
    result = []
    test = self.ingredients
    test.each do |ingredient_object|
      Allergen.all.each do |allergen_object|
        result << ingredient_object if allergen_object.ingredient == ingredient_object
      end
    end
    result.uniq
  end
end
