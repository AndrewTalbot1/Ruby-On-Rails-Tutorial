lucky_nums = [1,2,3,4,5]

begin
    num = 10 / 0
    # lucky_nums["dog"]
rescue ZeroDivisionError => zde
    puts zde
rescue TypeError => te
    puts te
end