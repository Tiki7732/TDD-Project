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
end

