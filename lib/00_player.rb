class Player
    attr_accessor :player_one, :player_two

    def initialize
        @player_one = player_one
        @player_two = player_two
    end
    def get_player_name
        player_one = gets.chomp.to.s
        player_two = gets.chomp.to_s
    end
end