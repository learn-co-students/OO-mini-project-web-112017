
class RecipeCard

@@all = []

attr_accessor  :user, :recipe
attr_reader :date, :rating

def initialize(user, recipe=nil, rating)
   # @title = title
   @user = user
   @recipe = recipe
   @@all << self
   @date = DateTime.now.strftime("%m/%d/%Y")
   @rating = rating
end

def self.all
   @@all
end

end
