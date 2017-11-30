class User
  @@all = []
  attr_accessor :name

  def self.all
    @@all
  end

  def initialize(name: nil)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, date, rating: nil)
    RecipeCard.new(user: self, recipe: recipe, date: date, rating: rating)
  end

  def recipe_cards
    RecipeCard.all.select do |i|
      i.user == self
    end
  end

  def find_allergens
    Allergen.all.select do |i|
      i.user == self
    end.uniq
  end

  def allergens
    self.find_allergens.map do |inst|
      inst.ingredient
    end.uniq
  end

  def declare_allergen(ingredient)
    Allergen.new(user: self, ingredient: ingredient)
  end

  def recipes
    self.recipe_cards.map do |x|
      x.recipe
    end
  end

  def most_recent_recipe
    self.recipes.last
  end

  def top_three_recipes
    a = self.recipe_cards.sort do |x,y|
      y.rating <=> x.rating
    end[0..2]

    a.map do |inst|
      inst.recipe
    end
  end

  def safe_recipes
    Recipe.all.select do |i|
      !(i.ingredients & self.allergens).any?
    end
  end

end
