module Messages
  ##
  # Super class that manages the messages logic of the app.
  # Responsible for the communication with the user and the
  # validation of that communication.
  # #
  class Message
    class WrongCommand
      MESSAGES = [
          "I don't know Rick! I think that's not going to work!",
          'Are you trying to cheat?',
          'Dude, you need to select a valid command.'
      ].freeze

      def initialize
        print "#{MESSAGES.sample} \n"
      end
    end

    protected

    def ask
      print "#{@question} \n"
      @input = gets.strip
      yield if block_given?
      @input
    end

    def valid?
      @options.include? @input
    end

    def ask_again(method, args = [])
      WrongCommand.new && send(method, *args) unless valid?
    end
  end
end