class Recipe
  @@all =[]

  attr_accessor :name, :users, :ingredient, :allergen

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
   @@all
  end

  def users
    RecipeCard.all.map do |recipe_card_obj|
      if recipe_card_obj.recipe == self
        recipe_card_obj.user
      end
    end.compact
  end

  def ingredients
    RecipeIngredient.all.select do |recipe_ingredients|
      recipe_ingredients.recipe == self
  end.map do |filtered_obj|
    filtered_obj.ingredient
  end
end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end

  def allergens
    #does this recipe include any ingredients that are allergens?
    allergen_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient.uniq
    end
    self.ingredients.select do |ingredient|
      allergen_ingredients.include?(ingredient)
    end
  end

  def self.most_popular
    #which recipe has more users? We need to iterate over each recipe, and see which recipe instance is longer
    all_recipe_names = RecipeCard.all.collect {|recipe_card| recipe_card.recipe}
    arr = all_recipe_names.map {|recipe| [all_recipe_names.count(recipe),recipe]}.uniq
  end
end
