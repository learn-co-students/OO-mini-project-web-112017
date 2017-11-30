class Recipe

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
    # RecipeIngredient.all.collect do |recipeingredient|
    #   recipeingredient.recipe
    # end.uniq
  end

  def self.most_popular
    #return the recipe instance with the highest number of users
    # (the recipe that has the most recipe cards) should return all of the recipe instances
    all_recipe_names = RecipeCard.all.collect {|recipecard| recipecard.recipe}
    arr = all_recipe_names.map {|recipe| [all_recipe_names.count(recipe),recipe]}.uniq #.reverse

    max = nil
    most_pop = []
    arr.each do |count_recipe|
      if max == nil || max == count_recipe[0]
         max = count_recipe[0]
         most_pop << count_recipe[1]
      elsif max < count_recipe[0]
        max = count_recipe[0]
        most_pop = count_recipe[1]
      else
         max
         most_pop
       end
    end
    return most_pop


    # max1 =all_recipe_names.map {|recipe| [all_recipe_names.count(recipe),recipe]}.sort[-1][1]
    # max2 = all_recipe_names.map {|recipe| [all_recipe_names.count(recipe),recipe]}.sort[-2][1]
    # if max1==max2
    #   [max1, max2]
    # else
    #   max1 #.index
    # end

    ##all_recipe_names[max_index]

  end

  def recipe_cards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end

  def users
    #should return the user instances who have recipe cards with this recipe
    self.recipe_cards.collect do |recipecard|
      recipecard.user
    end
  end

  def recipe_ingredient
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
  end

  def ingredients
    #should return all of the ingredients in this recipe
      self.recipe_ingredient.collect do |recipeingredient|
        recipeingredient.ingredient
      end
  end

  def allergens
    #should return all of the ingredients in this recipe that are allergens
    self.ingredients.select do |ingredient|
      Allergen.all_ingredient.include?(ingredient)
    end
  end

  def add_ingredients(ing_arr)
    #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ing_arr.each do |ingredient|
      RecipeIngredient.new(self,ingredient)
    end
  end
end
