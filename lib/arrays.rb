def my_uniq(array)
    array_hash = Hash.new(0)
    array.each {|item| array_hash[item] += 1}
    array_hash.keys
end

def two_sum(array)
    indicies = []
    array.each_with_index do |num1, ind1|
        array[ind1 + 1..-1].each_with_index do |num2, ind2|
            indicies.push([ind1, ind2+1+ind1]) if (num1 + num2 == 0)
        end
    end
    indicies
end

def my_transpose(grid)
    rotated = Array.new(grid.size){Array.new(grid.size)}
    grid.each_with_index do |row, ind1|
        row.each_with_index do |item, ind2|
            rotated[ind2][ind1] = item
        end
    end
    rotated
    #grid.transpose
end

def stock_picker(array)
    i = 0
    days = []
    diff = array[i] - array[0]
    while i < array.length - 1
        array[i +1..-1].each_with_index do |day, ind|
            if (day - array[i]) >= diff
                diff = day - array[i]
                days[0], days[1] = i, (ind + i + 1 )
            end
        end
        i += 1
    end
    days
end