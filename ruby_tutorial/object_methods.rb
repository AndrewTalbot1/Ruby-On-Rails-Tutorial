class Student

    @@todays_gpa = 2.0

    attr_accessor :name, :major, :gpa
    def initialize(name, major, gpa)
        @name = name
        @major = major
        @gpa = gpa
    end


    
    def has_honors
        if @gpa >= @@todays_gpa
            return true
        end
        return false
    end

    
end
student1 = Student.new("Jim", "Business", 2.6)
student2 = Student.new("Pam", "Art", 3.6)

puts (student1.has_honors)

