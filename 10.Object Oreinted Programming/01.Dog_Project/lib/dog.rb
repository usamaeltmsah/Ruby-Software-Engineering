class Dog
    def initialize(name, breed, age, bark, fav_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = fav_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(age)
        @age = age
    end



    def bark
        if @age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(food_item)
        @favorite_foods.any?{ |s| s.casecmp(food_item)==0 }
    end
end
