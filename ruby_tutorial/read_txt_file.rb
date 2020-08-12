File.open("employees.txt", "r") do |file|

    # puts file.read()
    # puts file.readline()
    # puts file.readline()
    for line in file.readlines()
        puts line
    end
end

#Alternative way of opening a file
#Store in a variable
file = File.open("employees.txt", "r")

puts(file.read)
file.close()