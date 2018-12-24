require_relative 'message'

module Messages
  class Greeting < Message
    GREET = 'Welcome to TIC-TAC-TOE on Ruby. Press ENTER to continue.'.freeze

    def initialize
      @question = GREET
      ask
    end
  end
end