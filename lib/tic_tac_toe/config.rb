##
# This class sets the defaults values for the game
# #
class Config
  DEFAULT_PLAYER_ONE_ATTRS  = { name: 'Player One', token: 'X' }.freeze
  DEFAULT_PLAYER_TWO_ATTRS  = { name: 'Bad Robot', token: 'O' }.freeze
  PLAYERS_DEFAULT = 1.freeze

  attr_accessor :players_number, :player_one, :player_two, :turns

  def initialize(
      players_number: PLAYERS_DEFAULT,
      player_one: Players::Human.new(DEFAULT_PLAYER_ONE_ATTRS),
      player_two: Players::Bot.new(DEFAULT_PLAYER_TWO_ATTRS))
  #
  # This comment is just for indentation use
  #
    @players_number = players_number
    @player_one     = player_one
    @player_two     = player_two
  end
end

