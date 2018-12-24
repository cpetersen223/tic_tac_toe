autoload :Messages, 'tic_tac_toe/messages'
autoload :Config, 'tic_tac_toe/config'
autoload :Players, 'tic_tac_toe/players'
autoload :Game, 'tic_tac_toe/game'

##
# This class initiate and leads a TicTacToe match.
# #
class Match
  TOKENS          = %w{ X O % & # }.freeze
  RESTART_OPTS    = %{ R r }.freeze

  def initialize
    ready # salute
    set   # configuration
    go    # start
  end

  private

  def salute
    Messages::Greeting.new
  end

  def configuration
    @tokens = TOKENS
    @quiz   = Messages::Config.new
    @board  = Game::Board.new
    @config = Config.new
    if @quiz.continue?
      @config.players_number = @quiz.players_number.to_i
      set_player_one
      playing_solo_mode? ? set_player_two_token : set_player_two
    end
  end

  def start
    who_starts?
    set_turns
    @current_player = current_player
    @winner         = play
    until @winner
      @current_player = current_player
      break if @current_player.nil?
      @winner = play
    end
    game_over
  end

  alias_method :ready, :salute
  alias_method :set, :configuration
  alias_method :go, :start

  def play
    draw_board
    @play = Game::Play.new plays: @board.plays, player: @current_player
    @board.check_box @play
    @board.check_winner
  end

  def game_over
    draw_board
    @message = Messages::GameOver.new @winner, @current_player
    restart if RESTART_OPTS.include? @message.input
  end

  def restart
    set
    go
  end

  def current_player
    @current_player = @config.turns.shift&.player
  end

  def draw_board
    @board.draw_legend
    @board.draw_boxes
  end

  def who_starts?
    player1, player2 = @config.player_one, @config.player_two
    starts = @quiz.player_starts(player1.name, player2.name).to_i
    starts == 1 ? player1.starts = true : player2.starts = true
  end

  def set_turns
    @config.turns = Game::Turns.new(@config.player_one, @config.player_two).turns
  end

  def playing_solo_mode?
    @config.players_number == 1
  end

  def set_player_one
    @config.player_one = new_player_kind(:one) if player_kind?(:one)
    @config.player_one.name   = @quiz.player_name :one
    @config.player_one.token  = @quiz.player_token :one, @tokens
  end

  def set_player_two
    @config.player_one = new_player_kind(:two) if player_kind?(:two)
    @config.player_two.name   = @quiz.player_name :two
    @config.player_two.token  = @quiz.player_token :two, available_tokens
  end

  def player_kind?(player_number)
    kind = @quiz.player_kind player_number
    @new_kind = %w{ H h }.include?(kind) ? :human : :bot
    player = @config.send("player_#{player_number}")
    @new_kind != player.kind
  end

  def new_player_kind(player_number)
    new_kind = Kernel.const_get("Players::#{@new_kind.to_s.capitalize}")
    new_config = Kernel.const_get("Config::DEFAULT_PLAYER_#{player_number.upcase}_ATTRS")
    new_kind.new(new_config)
  end

  def available_tokens
    @tokens - [ @config.player_one.token ]
  end

  def set_player_two_token
    @config.player_two.token = available_tokens.sample
  end
end
