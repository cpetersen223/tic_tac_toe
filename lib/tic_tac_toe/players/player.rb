module Players
  class Player
    attr_reader :token, :name, :starts, :type

    def initialize(token:, name:, starts: false)
      @token  = token
      @name   = name
      @starts = starts
    end

    def starts?
      @starts
    end

    def to_s
      @type
    end
  end
end
