#Assumes user will enter numbers
puts ("Please enter first number")
num1 = gets.chomp().to_f
puts ("Please enter an operator")
op = gets.chomp()
puts ("Please enter second number")
num2 = gets.chomp().to_f

if op == "+"
    puts (num1 + num2)
elsif op == "-"
    puts (num1 - num2)
elsif op == "/"
    puts (num1 / num2)
elsif op == "*"
    puts (num1 * num2)
else
    puts ("Invalid operator")
end