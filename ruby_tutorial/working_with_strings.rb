# Escap character
puts "Hi\" Here is a string with quotes \"" 

# Use of variables
phrase = "Hi"
puts phrase

# Use of uppercase
puts phrase.upcase()

# User of lowercase
puts phrase.downcase()

phrase2 = "         Hi          "
puts phrase2.strip()
puts phrase2.length()

puts phrase.include? "Hi"
puts phrase.include? "This should read false"

#Print a character in a String
phrase3 = "Printing out characters"
puts (phrase3[0] + " This should print out the first index also \"P\"")


#Prints a list of characters

puts phrase3[0,3]

#Print the index position of a string
puts phrase3.index("Printing")