require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/", __FILE__)
require '00_player'
require '01_board_case'
require '02_board'
require '03_game'

class Application
  def initialize
    tic_tac_toe = Game.new
    tic_tac_toe.go
  end
end

Application.new