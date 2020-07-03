require 'arrays'

describe Arrays do
    subject
    describe '#my_uniq' do
    it 'takes an array, removes duplicate entries, returns entries in order they appeared' do
        dups_array = [4, 2, 3, 7, 2, 9, 9, 0, 7, 4, 1, 6]
        dupless_array = [4, 2, 3, 7, 9, 0, 1, 6]
        expect (my_uniq(dups_array)).to eq(dupless_array)
    end

end