class Towers

    attr_reader :tower1, :tower2, :tower3
    def initialize(difficulty)
        @difficulty = difficulty
        @tower1 = (1..difficulty).to_a
        @tower2 = []
        @tower3 = []
    end

end