# require '../helpers/string'
autoload :Messages, 'messages'
autoload :Players, 'players'
autoload :Board, 'board'
autoload :Config, 'config'
autoload :Game, 'game'

class Match
  def initialize
    greet
    configure?
  end

  private

  def greet
    Greeting.new
  end

  def configure?
    @config = Config.new
    if @config
      p 'Entré'
    else
      p 'No entré'
    end
  end
end