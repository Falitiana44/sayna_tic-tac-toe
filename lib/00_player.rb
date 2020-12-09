require 'bundler'
Bundler.require

class Player
  attr_accessor :player_name, :player_symbol
  @@all_players = []

  def initialize(name, symbol)
    @player_name = name
    @player_symbol = symbol
    @@all_players << self
  end
  
  def self.get_all_players
    @@all_players
  end
end
