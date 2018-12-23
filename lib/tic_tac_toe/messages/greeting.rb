require_relative 'message'

module Messages
  class Greeting < Message
    MESSAGE = 'Welcome to TIC TAC TOE on Ruby'.freeze

    def initialize
      @message = MESSAGE
      ask
    end
  end
end