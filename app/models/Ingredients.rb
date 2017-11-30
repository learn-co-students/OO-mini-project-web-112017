class Ingredient

  extend Deletable
  attr_accessor :name, :substitute
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    #returns most common allergen
    allergens = {}
    Allergen.all.each do |allergen|
      if allergens[allergen.ingredient]
        allergens[allergen.ingredient] += 1
      else
        allergens[allergen.ingredient] = 1
      end
    end

    allergens.select{|ingredient, count| count == allergens.values.max}
  end

  def self.delete(ingredient)

    #delete recipe ingredient
    delete_helper(RecipeIngredient.all, ingredient)
    #delete allergens
    delete_helper(Allergen.all, ingredient)

    Ingredient.all.delete(ingredient)

  end

end
