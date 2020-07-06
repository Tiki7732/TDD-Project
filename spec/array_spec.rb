require 'arrays'
   
describe "my_uniq" do
    let(:dups_array) {[4, 2, 3, 7, 2, 9, 9, 0, 7, 4, 1, 6]}
    #let(:dupless_array) {my_uniq(dups_array.dup)}
    let(:dupless_array)  {[4, 2, 3, 7, 9, 0, 1, 6]}
    it  'removes duplicates' do
        # dups_array.each do |item|
        #    expect(dupless_array.count(item)).to eq(1)
        # end
        expect(my_uniq(dups_array)).to eq(dupless_array)
    end

    it "doesn't change original" do
        expect(my_uniq(dups_array)).to_not change{dups_array}
    end

    it "returns items in order they appeared" do
        dups_hash = {}
        dupless_hash = {}
        dups_array.each {|num| dups_hash[num] = 1}
        my_uniq(dups_array).each {|num| dupless_hash[num] = 1}
        expect(dups_hash.keys).to eq(dupless_hash.keys)
    end

end

describe "#two_sum" do
    let(:test) {[-1, 0, 2, -2, 1, 0, -3, 4, -4, 3, 1]}

    it "finds pairs whose elements add up to zero"

    it "sorts with smaller elements first"

    it "sorts with smaller pair first"
end
