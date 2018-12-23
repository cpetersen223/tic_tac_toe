module Messages
  class Message

    protected

    def ask
      print @question
      @input = gets.strip
      yield
      @input
    end

    def valid?
      @options.include? @input
    end
  end
end