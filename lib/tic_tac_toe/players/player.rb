module Players
  class Player
    attr_accessor :token, :name, :starts
    attr_reader :type

    def initialize(token:, name:, starts: false)
      @token  = token
      @name   = name
      @starts = starts
    end

    def to_s
      @type
    end

    alias starts? starts
  end
end
