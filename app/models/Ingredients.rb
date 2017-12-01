class Ingredient

  attr_accessor :name, :allergen

  @@all = []

 def initialize(name)
   @name = name
   #@allergen = allergen
   @@all << self
 end

  def self.all
    @@all
  end

  def self.most_common_allergen
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
end
