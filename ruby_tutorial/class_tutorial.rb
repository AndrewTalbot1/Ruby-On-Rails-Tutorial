# class Book
#     attr_accessor :title, :author, :pages
    
# end


# book1 = Book.new()
# book1.title = "Harry Potter"
# book1.author = "JK Rowling"
# book1.pages = 400

# puts book1.pages

# book2 = Book.new()
# book2.title = "Lord of the rings"
# book2.author = "Tolkein"
# book2.pages = 500

# puts book2.author


## Initalize Method ##

 class Book_2
    attr_accessor :title, :author, :pages
    def initialize(title , author, pages)
        @title = title
        @author = author
        @pages = pages 
    end
end
book3 = Book_2.new("Programming", "Andrew", 500)
puts (book3.title)