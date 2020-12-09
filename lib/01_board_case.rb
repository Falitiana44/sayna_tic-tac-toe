require 'bundler'
Bundler.require

class BoardCase
  attr_accessor :position, :content
  def initialize(case_position, case_content)
    @position = case_position
    @content = case_content
  end
end