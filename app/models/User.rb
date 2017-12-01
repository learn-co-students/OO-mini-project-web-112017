class User
  @@all = []

  attr_accessor :name, :allergen

  def initialize(name)
    @name = name
    #@allergen = allergen
    @@all << self
    #@recipes = []
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, date, rating)
      new_recipe_card = RecipeCard.new(self, recipe, date, rating)
      new_recipe_card.user = self
  end

  def recipes
    RecipeCard.all.select do |obj|
      obj.user == self
    end.map do |filtered_obj|
      filtered_obj.recipe
    end
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
       allergen.user == self
    end.map do |allergen_obj|
        allergen_obj.ingredient
  end
end

def top_three_recipes
  RecipeCard.all.select do |recipe_obj|
  recipe_obj.user == self
  end.sort_by do |obj|
    obj.rating
  end
end

def most_recent_recipe
  RecipeCard.all.select do |recipe_obj|
  recipe_obj.user == self
  end.sort_by do |obj|
    obj.date
  end
end
end
