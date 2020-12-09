require 'bundler'
Bundler.require

require_relative '00_player'
require_relative '01_board_case'
require_relative '02_board'

class Game
  attr_accessor :player1, :player2, :board

  def initialize
    puts "Eh toi, dis-moi comment tu t'appelles (X)"
    print "> "
    name_player1 = gets.chomp
    @player1 = Player.new("#{name = name_player1}", "#{symbol = "X"}")
    puts "Super ! L'autre à côté, file-moi ton blase aussi (O)"
    print "> "
    name_player2 = gets.chomp
    @player2 = Player.new("#{name = name_player2}", "#{symbol = "O"}")
    puts "Bienvenue dans ce morpion #{name_player1} et #{name_player2}"
    @board = Board.new
 
  end
  
  def go
    puts " #{player1.player_name} va jouer le premier"
    play_turn 
  end

  def play_turn
    puts "#{@board.start}"
    puts "#{@board.top}"
    turn = 1
    while turn < 10 && !victory do 
        if turn.odd? 
          sleep (2)
          puts "#{@board.start}"
          puts "#{@board.show_game}"
          puts "C'est ton tour #{player1.player_name}, que souhaites-tu jouer ?"
          print ">"
          next_move = gets.chomp
          if @board.get_cases_array.any? {|x| x.position == next_move} 
            @board.get_cases_array.each do |x| 
              if x.position == next_move
                if x.content == " " 
                  x.content = "#{player1.player_symbol}"
                  if self.victory 
                    puts "#{@board.start}"
                    puts "#{@board.show_game}"
                    puts "#{player1.player_name} a remporté la partie !"
                  end               
                else
                  puts "Tricheur, la case est déjà renseignée"
                  turn -=1
                end 
              end
            end
          else
            puts "Cette case n'existe pas LOL'"
            turn -=1
          end
        elsif !victory 
          sleep (2)
          puts "#{@board.start}"
          puts "#{@board.show_game}"
          puts "C'est ton tour #{player2.player_name}, essaye de gagner cette fois !"
          print ">"
          next_move = gets.chomp
          if  @board.get_cases_array.any? {|x| x.position == next_move}
            @board.get_cases_array.each do |x|
              if x.position == next_move
                if x.content == " "  
                  x.content = "#{player2.player_symbol}" 
                  if self.victory
                    puts "#{@board.start}"
                    puts "#{@board.show_game}"
                    puts "#{player2.player_name} a remporté la partie !"
                  end
                else
                  puts "Tricheur, la case est déjà renseignée"
                  turn -=1
                end
              end
            end
          else
            puts "Cette case n'existe pas LOL"
            turn -=1
          end
        end
        turn += 1
    end
    if turn == 10 && !victory
      puts "Match nul!"
    end
    puts "La partie est terminée"
  end

  def victory
    if @board.get_cases_array[0].content == @board.get_cases_array[1].content && @board.get_cases_array[1].content == @board.get_cases_array[2].content && @board.get_cases_array[2].content !=" "
      return true
    elsif @board.get_cases_array[3].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[5].content && @board.get_cases_array[5].content !=" "
      return true
    elsif @board.get_cases_array[6].content == @board.get_cases_array[7].content && @board.get_cases_array[7].content == @board.get_cases_array[8].content && @board.get_cases_array[8].content !=" "
      return true
    elsif @board.get_cases_array[0].content == @board.get_cases_array[3].content && @board.get_cases_array[3].content == @board.get_cases_array[6].content && @board.get_cases_array[6].content !=" "
      return true
    elsif @board.get_cases_array[1].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[7].content && @board.get_cases_array[7].content !=" "
      return true
    elsif @board.get_cases_array[2].content == @board.get_cases_array[5].content && @board.get_cases_array[5].content == @board.get_cases_array[8].content && @board.get_cases_array[8].content !=" "
      return true
    elsif @board.get_cases_array[0].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[8].content && @board.get_cases_array[8].content !=" "
      return true
    elsif @board.get_cases_array[2].content == @board.get_cases_array[4].content && @board.get_cases_array[4].content == @board.get_cases_array[6].content && @board.get_cases_array[6].content !=" "
      return true
    else
      return false
    end
  end
 
end