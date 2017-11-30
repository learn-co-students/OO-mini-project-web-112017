class User

  @@all = []

  def self.all
    @@all
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, date, rating)
    rc = RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    a = Allergen.all.select do |row|
      row.user == self
    end

    a.map do |row|
      row.ingredient
    end
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
  end

  def recipes
    self.recipe_cards.collect do |recipe_card|
      recipe_card.recipe
    end
  end

  def most_recent_recipe
    self.recipes.last
  end

  def top_three_recipes
    array = self.recipe_cards.sort do |x,y|
      y.rating <=> x.rating
    end
    array[0..2].map do |recipe_card|
      recipe_card.recipe
    end
  end

  def safe_recipes
    Recipe.all.select do |recipe_obj|
      !(recipe_obj.ingredients & self.allergens).any?
    end
  end

end
