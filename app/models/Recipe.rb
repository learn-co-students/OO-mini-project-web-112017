class Recipe

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients(ingredients)
  # Recipe#add_ingredients should take an array of ingredient instances as an argument,
  # and associate each of those ingredients with this recipe
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def recipecards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end


  def users
  # Recipe#users should return the user instances who have recipe cards with this recipe
    self.recipecards.collect do |recipecard|
      recipecard.user
    end
  end

  def recipeingredient
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
  end

  def ingredients
  # Recipe#ingredients should return all of the ingredients in this recipe
    self.recipeingredient.collect do |recipeingredient|
      recipeingredient.ingredient
    end
  end

  def allergens
  # Recipe#allergens should return all of the ingredients in this recipe that are allergens
    self.ingredients.select do |ingredient|
      Allergen.all_ingredients.include?(ingredient)
    end
  end


  def self.most_popular
  # Recipe.most_popular should return the recipe instance with the highest number of users
  # (the recipe that has the most recipe cards)
    recipe_instances = RecipeCard.all.collect {|recipecard| recipecard.recipe}
    rankings = recipe_instances.map {|recipe| [recipe_instances.count(recipe), recipe]}.uniq
    rankings.sort_by! {|ranking| ranking.first}

    top_frequency = rankings.last.first

    rankings.select {|ranking| ranking.first == top_frequency}.map {|ranking| ranking.last}
  end

end
