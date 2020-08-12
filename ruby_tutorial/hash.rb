#hash has a key value pair
#Must be unique 

states = {
    "Pennsylvania" => "PA",
    :Arizona => "AZ",
    "New York" => "NY",
    "Oregon" => "OR"
}


#puts (states) will print out the whole structure

# When you pass a key it will print a value
puts (states["Oregon"])

#You can also show a key value pair as 
puts (states[:Arizona])