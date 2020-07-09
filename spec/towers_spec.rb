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
                expect{towers.move(tower1, tower2)}.to raise_error("Not a valid move")

            end
        end

        describe "#won?" do
            let(:towers) do 
                towers = Towers.new(3)
                tower1 = towers.tower1
                tower2 = towers.tower2
                tower3 = towers.tower3
                towers.move(tower1, tower3)
                towers.move(tower1, tower2)
                towers.move(tower3, tower2)
                towers.move(tower1, tower3)
                towers.move(tower2, tower1)
                towers.move(tower2, tower3)
                towers.move(tower1, tower3)
                towers
            end
            #tower1 = towers.instance_variable_get(:tower1)

            it "should check if the first two arrays are empty" do
                # tower1 = towers.tower1
                # tower2 = towers.tower2
                # tower3 = towers.tower3
                # towers.move(tower1, tower3)
                # towers.move(tower1, tower2)
                # towers.move(tower3, tower2)
                # towers.move(tower1, tower3)
                # towers.move(tower2, tower1)
                # towers.move(tower2, tower3)
                # towers.move(tower1, tower3)
                expect(towers.tower1).to be_empty
                expect(towers.tower2).to be_empty
            end

            it "should check that the last array has all the disks" do
                expect(towers.tower3.length).to eq(towers.difficulty)
            end

            it "should return true" do
                expect(towers.won?).to eq(true)
            end

            context "when there are remaining disks on either of first 2 towers" do
                
                it "should return false" do
                    tower3 = towers.tower3
                    tower1 = towers.tower1
                    towers.move(tower3, tower1)
                    expect(towers.won?).to eq(false)
                end
            end

        end
    end

end