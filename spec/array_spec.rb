require 'arrays'
require 'towers'

describe "PART 1" do
    describe "my_uniq" do
        let(:dups_array) {[4, 2, 3, 7, 2, 9, 9, 0, 7, 4, 1, 6]}
        let(:dupless_array) {my_uniq(dups_array.dup)}
        #let(:dupless_array)  {[4, 2, 3, 7, 9, 0, 1, 6]}
        it  'removes duplicates' do
            dups_array.each do |item|
            expect(dupless_array.count(item)).to eq(1)
            end
            #expect(my_uniq(dups_array)).to eq(dupless_array)
        end

        it "doesn't change original" do
            expect{my_uniq(dups_array)}.to_not change {dups_array}
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
        let(:pairs) {two_sum(test)}

        it "finds pairs whose elements add up to zero" do
            #expect(pairs.length).to eq(6)
            pairs.each do |pair|
                expect(test[pair.first] + test[pair.last]).to eq(0)
            end
        end

        it "first num in order smallest to largest" do
            first_eles = []
            pairs.each do |pair|
                first_eles.push(pair.first)
            end
            expect(first_eles).to eq(first_eles.sort)
        end

        it "second element in order of smallest to largest" do
            pairs[0...-1].each_with_index do |pair, ind|
                if pairs[ind].first == pairs[ind+1].first
                    expect(pairs[ind].last).to be < (pairs[ind+1].last)
                end
            end
        end
    end

    describe "#my_transpose" do
        let(:grid) {[[0,1,2], [3,4,5], [6,7,8]]}
        let(:rotated_grid) {my_transpose(grid)}

        it "returns a new 2d array" do
            rotated_grid.each {|row| expect(row).to be_a Array}
        end

        it "rotates 2d array 90 degrees" do
            column = [grid[0][2], grid[1][2], grid[2][2]]
            expect(column).to eq(rotated_grid[2])
        end
    end

    describe "#stock_picker" do
        let(:stock) {[1, 4, 3, 18, 12, 19, 0, 6, 10, 12, 16, 17, 16, 15, 14, 11, 10]}
        let(:most_profit) {stock_picker(stock)}

        it "picks the largest gap" do
            buy = stock[most_profit.first]
            sell = stock[most_profit.last]
            expect(sell - buy).to eq(18)
        end

        it "returns 2 days" do
            expect(most_profit.length).to eq(2)
        end

        it "picks a day to buy before day to sell" do
            expect(most_profit.first).to be < (most_profit.last)
        end
    end
end


# describe "Towers" do
#     let (:towers) {Towers.new(3)}

#     describe "#initialize" do
#         it "should set difficulty level as a number between 1 and 10" do
#             expect(towers.instance_variable_get(:@difficulty)).to be_a(Integer)
#             expect(towers.instance_variable_get(:@difficulty)).to be_between(1, 10)
#         end

#         it "should initialize 3 arrays" do
#             expect(towers.instance_variable_get(:@tower1)).to be_a(Array)
#             expect(towers.instance_variable_get(:@tower2)).to be_a(Array)
#             expect(towers.instance_variable_get(:@tower3)).to be_a(Array)
#         end

#         it "should initialize first array with disks" do
#             expect(towers.tower1).to_not be_empty
#             expect(towers.tower1.length).to eq(towers.instance_variable_get(:@difficulty))
#         end
#     end
# end
