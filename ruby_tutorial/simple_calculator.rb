# This program only adds numbers
puts "Enter a number"
num1 = gets.chomp().to_f   # Gets the user number and converts to a float
puts "Enter a second number"
num2 = gets.chomp().to_f
puts "The answer is: "
puts(num1 + num2)

# num1 is a string you have to convert it to an integet with the .to_i
#When entering a float number you have to use the .to_f