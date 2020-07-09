class Towers

    attr_reader :tower1, :tower2, :tower3, :difficulty
    def initialize(difficulty)
        @difficulty = difficulty
        @tower1 = (1..difficulty).to_a
        @tower2 = []
        @tower3 = []
    end

    def won?
        return false unless tower1.empty? && tower2.empty?
        return false unless tower3.sort.reverse! == tower3
        true
    end

end