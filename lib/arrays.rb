def my_uniq(array)
    array_hash = Hash.new(0)
    array.each {|item| array_hash[item] += 1}
    array_hash.keys
end
