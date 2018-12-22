# require_relative 'player'
# require_relative 'board'
# require_relative 'modules/texts'
# require_relative 'modules/config'
#
# class App
#   extend Texts
#   attr_accessor :number_of_players, :player_one, :player_two
#
#   def initialize
#     @board = Board.new
#   end
#
#   class << self
#     def run
#       new; greeting
#       set_configuration if config?
#       p @number_of_players
#     end
#
#     private
#
#     def config?
#       @config = Config.new
#     end
#
#     # def config?
#     #   ask_configuration
#     #   input = gets.strip
#     #   return config? unless valid_input? input, CONFIGURATION_CHOICES
#     #   will_config? input, VALID_CHOICES
#     # end
#     #
#     # def set_configuration
#     #   players_number
#     # end
#     #
#     # def players_number
#     #   ask_players_number
#     #   @number_of_players = gets.strip
#     #   players_number unless valid_input? @number_of_players, %w{1 2}
#     # end
#
#     def valid_input?(option, args = [])
#       return false unless args.class == Array
#       args.include? option
#     end
#
#     alias_method :will_config?, :valid_input?
#   end
# end