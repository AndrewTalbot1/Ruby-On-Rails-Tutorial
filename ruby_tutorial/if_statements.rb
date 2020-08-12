#IF statements in ruby

ismale = true
istall = true

if ismale || istall
    puts ("You are male")
else
    puts ("You are not male")
end

#If statement continued

def max(num1, num2, num3)
    if num1 >= num2 and num1 >= num3
        return num1
    elsif num2 >= num1 and num2 >=num3
        return num2
    else 
        return num3
    end
end

puts max(1, 20, 3)
