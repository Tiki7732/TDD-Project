class Towers

    attr_reader :tower1, :tower2, :tower3, :difficulty
    def initialize(difficulty)
        @difficulty = difficulty
        @tower1 = (1..difficulty).to_a.sort.reverse!
        @tower2 = []
        @tower3 = []
        @quit = false
    end

    def play
        
        until won? || @quit
            begin
                system('clear')
                show_towers
                from_tower = get_from
                next if from_tower.nil?
                to_tower = get_to
                next if to_tower.nil?
                move(from_tower, to_tower)
            rescue Exception => e
                puts e.message
                retry
            end
            puts "Congrats! You Won!" if won?
            puts "See you next time"
        end  
    end

    private

    def show_towers
        size = @difficulty - 1
            print " Tower  Tower  Tower \n"
            print "   1      2      3 \n"
            print "\n"
        while size >= 0 
            print "   #{tower1[size]}      #{tower2[size]}      #{tower3[size]} \n"
            size -= 1
        end
    end

    def move(from_tower, to_tower)
         if valid_move?(from_tower, to_tower)
            to_tower.push(from_tower.pop)
            return true
         else
            raise StandardError.new ("Not a valid move")
            return false
         end
    end

    def get_from
        puts "Which tower would you like to move from?"
        user_in = gets.chomp
        case user_in
        when '1'
            return tower1
        when '2'
            return tower2
        when '3'
            return tower3
        when 'q'
            @quit = true
            return nil
        else
            puts "That wasn't a valid tower"
            get_from
        end
    end

    def get_to
        puts "Which tower would you like to move to?"
        user_in = gets.chomp
        case user_in
        when '1'
            return tower1
        when '2'
            return tower2
        when '3'
            return tower3
        when 'q'
            @quit = true
            return nil
        else
            puts "That wasn't a valid tower"
            get_to
        end
    end



    def valid_move?(from_tower, to_tower)
        return false if from_tower.empty?
        return false unless to_tower.empty? || from_tower.last < to_tower.last
        true
    end

    def won?
        return false unless tower1.empty? && tower2.empty?
        return false unless tower3.sort.reverse! == tower3
        return false unless tower3.length == difficulty
        true
    end

end

t = Towers.new(3)
t.play