class RecipeCard

    @@all = []
    attr_accessor :date, :rating, :recipe, :user

    def initialize(user, recipe, date, rating)
      @user = user
      @date = date
      @rating = rating
      @recipe = recipe
      #User.add_recipe_card(self)
      @@all << self
    end

    def self.all
      @@all
    end
end
