class Chef
    def make_chicken
        puts "The chef makes chicken"
    end
    def make_salad
        puts "The chef makes salad"
    end
    def make_special_dish
        puts "The chef makes bbq ribs"
    end
end

#Inheritance
#ItalianChef is a sub class of the Chef Class
class ItalianChef < Chef
 #There is nothing in this class it uses the Chef class

 #Overriding the inheritance
    def make_special_dish
        puts "Pizza"
    end

end


italian_chef = ItalianChef.new()
italian_chef.make_special_dish