class User
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select { |card| card.user == self}
  end

  def add_recipe_card (recipe, date, rating )
    RecipeCard.new(recipe,self,date,rating)
  end

  def declare_allergen (ingredient)
    Allergen.new(self,ingredient)
  end

  def allergens
    Allergen.all.select { |allergy| allergy.user == self }
  end

  def top_three_recipes
      self.recipes.sort_by {|recipe| recipe.rating }.last(3).reverse
  end

  def most_recent_recipe
    RecipeCard.all.last.recipe
  end

end
