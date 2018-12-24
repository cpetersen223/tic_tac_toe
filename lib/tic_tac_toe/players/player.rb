module Players
  class Player
    attr_accessor :token, :name, :starts

    def initialize(token:, name:, starts: false)
      @token  = token
      @name   = name
      @starts = starts
    end

    def kind
      @type
    end

    alias starts? starts
  end
end
