class BoardCase
    attr_accessor :boardcase_aray
    def initialize
        @number = gets.chomp.to_s
        @boardcase_array = boardcase_array = ['1','2','3','4','5','6','7','8','9']
    end

    def display_board
        
    end
    
    def check_array
        if @boardcase_array.include?(@number)
            "true"
        else
            "false"
        end
    end
end

andrana = BoardCase.new
andrana.check_array