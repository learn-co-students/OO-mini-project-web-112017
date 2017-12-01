
class Ingredients

attr_accessor :name
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_users_allergens
    Allergen.all.map do |allergen|
    allergen.ingredient
    end
  end

  def self.most_common_allergen
    arr = self.all_users_allergens
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    arr.max_by { |v| freq[v] }
  end

end
