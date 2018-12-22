class Player
  attr_reader :token, :name, :type, :starts

  def initialize(token:, name:, type: :human, starts: false)
    @token  = token
    @name   = name
    @type   = type
    @starts = starts
  end

  def starts?
    @starts
  end
end