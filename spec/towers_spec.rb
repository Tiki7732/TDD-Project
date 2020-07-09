require 'towers'

describe "PART 2" do
    describe "Towers" do
        let (:towers) {Towers.new(3)}

        describe "#initialize" do
            it "should set difficulty level as a number between 1 and 10" do
                expect(towers.instance_variable_get(:@difficulty)).to be_a(Integer)
                expect(towers.instance_variable_get(:@difficulty)).to be_between(1, 10)
            end

            it "should initialize 3 arrays" do
                expect(towers.instance_variable_get(:@tower1)).to be_a(Array)
                expect(towers.instance_variable_get(:@tower2)).to be_a(Array)
                expect(towers.instance_variable_get(:@tower3)).to be_a(Array)
            end

            it "should initialize first array with disks" do
                expect(towers.tower1).to_not be_empty
                expect(towers.tower1.length).to eq(towers.instance_variable_get(:@difficulty))
            end

            it "should initialize other 2 arrays to empty arrays" do
                expect(towers.tower2).to be_empty
                expect(towers.tower3).to be_empty
            end
        end

        describe "#move" do
            it "should accept a from array and a to array"

            it "should place the last element from the "
        end
    end

end