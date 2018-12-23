require_relative 'player'

module Players
  class Bot < Player
    def initialize(token:, name:, starts: false)
      @type = :bot
      super
    end
  end
end
