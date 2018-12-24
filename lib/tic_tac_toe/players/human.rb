require_relative 'player'

module Players
  class Human < Player
    def initialize(token:, name:, starts: false)
      @type = :human
      super
    end
  end
end
