require 'bundler'
Bundler.require

require_relative '01_board_case'

class Board
  attr_accessor :a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3
  @@cases_array = []
  @@cases_grid = []
  
  def initialize
    @a1 = BoardCase.new("A1", " ")
    @a2 = BoardCase.new("A2", " ")
    @a3 = BoardCase.new("A3", " ")
    @b1 = BoardCase.new("B1", " ")
    @b2 = BoardCase.new("B2", " ")
    @b3 = BoardCase.new("B3", " ")
    @c1 = BoardCase.new("C1", " ")
    @c2 = BoardCase.new("C2", " ")
    @c3 = BoardCase.new("C3", " ")
  end
  
  def get_cases_array
    @@cases_array = [@a1, @a2, @a3,@b1, @b2, @b3, @c1, @c2, @c3]
    @@cases_array 
  end

  def get_grid
    @@cases_grid = [[@a1, @a2, @a3],[@b1, @b2, @b3], [@c1, @c2, @c3]]
    @@cases_grid
  end

  def show_game
    get_grid
    top
    puts "" 
    n = 65.chr
    puts "        1         2         3"
    @@cases_grid.each do |x|
      puts "    --------- --------- ---------"
      puts " #{n} |    #{x[0].content}    |    #{x[1].content}    |    #{x[2].content}    |"
      n = ("#{n}".ord + 1)
      n = n.chr
    end
    puts "    --------- --------- ---------"
  end

  def start
    system "clear"
  end

  def top
    puts "|///////////////////////////////////////////////////////////////|"
    puts "|                        Bienvenue sur                          |"
    puts "|                        'TIC TAC TOE'                          |"
    puts "|                            1 VS 1                             |"
    puts "|///////////////////////////////////////////////////////////////|"
  end 
end