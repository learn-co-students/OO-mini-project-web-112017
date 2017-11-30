class Ingredient
  attr_reader :name
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    #should return the ingredient instance that the highest number of users are allergic to
    allergen_count = Allergen.all.inject(Hash.new(hash)) { |allergen,count| allergen[count] += 1; allergen }
    Allergen.all.max_by { |count| allergen_count[count] }.ingredient
  end
end
