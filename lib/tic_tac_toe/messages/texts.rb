module Texts
  GREETING = 'Welcome to TIC TAC TOE on Ruby'.freeze
  CONFIGURATION = 'Do you want to set up the game? [Y/n]'.freeze
  PLAYERS_NUMBER = 'How many players wants to play? [1/2]'.freeze

  def greeting; print GREETING;end
  def ask_configuration; print CONFIGURATION; end
  def ask_players_number; print PLAYERS_NUMBER; end

  def ask_player_for_token
    print "Please enter a letter/symbol that you want to use as a token #{@player.to_s.tr('_', ' ')}: "
  end

  def ask_player_for_name
    print "Please enter the name of the #{@player.to_s.tr('_', ' ')}: "
  end

  def ask_player_for_type
    print "Please enter the type of player of #{@player.to_s.tr('_', ' ')} (Human/Bot) [H/b]: "
  end

  def ask_player_for_play
    print "Please select an empty box for your play #{@player.name} (Use the legend as a guideline): "
  end

  def ask_who_player_starts
    print "Which player wants to start: #{@player_one_attrs[:name]} -> [1] or #{@player_one_attrs[:name]} -> [2]?"
  end

  def wrong_play
    phrases = [
        "I don't know Rick! I think that's not going to work! ",
        'Are you trying to cheat? ',
        'Dude, you need to select a valid box. '
    ]
    print phrases.sample
  end
end