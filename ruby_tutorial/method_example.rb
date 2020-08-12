#This method will just say hi to the user
#We have to  all the method as well
def sayhi
    puts "Hello User"
end

#Call the method
puts "Top"
sayhi
puts "Bottom"

#passing parameters
#Sometimes giving defaault values is a good idea

def sayhiback(name ="no name", age =-1)
    puts ("Hello " + name + " you are " + age.to_s)
end

sayhiback()