class Ingredient

  @@all = []

  def initialize(name)
    @name = name 
    @@all << self
  end

  def self.all
    @@all
  #   Allergen.all.collect do |allergen|
  #     allergen.ingredient
  # end.uniq
  end

  def self.most_common_allergen
    #should return the ingredient instance that the highest number of users are allergic to
    all_ingredient = Allergen.all.collect {|allergens| allergens.ingredient}
    all_ingredient.map {|ingredient| [all_ingredient.count(ingredient),ingredient]}.max[1]
  end

end
