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

            it "should initialize first array with numbers representing disks" do
                expect(towers.tower1).to_not be_empty
                expect(towers.tower1.length).to eq(towers.instance_variable_get(:@difficulty))
            end

            it "should initialize other 2 arrays to empty arrays" do
                expect(towers.tower2).to be_empty
                expect(towers.tower3).to be_empty
            end
        end

        describe "#move" do
            let(:tower1) {[3,2,1]}
            let(:tower2) {[]}
            let(:tower3) {[]}

            it "should accept an array to move from and one to move to" do
                towers.move(tower1, tower2)
            end

            it "should move an element from the first array to the target array" do
                towers.move(tower1, tower2)
                expect(tower1).to eq([3,2])
                expect(tower2).to eq([1])
            end

            it "should not put a bigger disk on a smaller disk" do
                towers.move(tower1, tower2)
                expect(towers.move(tower1, tower2)).to raise_error("Can't put a larger disk on a smaller disk")
            end
        end

        describe "#won?" do
            it "should check if the first two arrays are empty"

            it "should check that the last array has all the disks"

            it "should check the order of the last array"

            it "should return true"

            context "when there are remaining disks on either of first 2 towers" do
                let(:tower1) {[5,4,3]}
                it "should return false" do
                    
                    expect(towers.won?).to eq(false)
                end
            end

        end
    end

end