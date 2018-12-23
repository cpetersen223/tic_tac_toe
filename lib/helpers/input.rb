class Input
  def initialize(msg, validation_opts = [])
    @msg = msg
    @validation_opts = validation_opts
  end

  def send
    print @msg
    @value = gets.strip
  end

  def valid?
    validate
  end

  private

  def validate
    return true if @validation_opts.length < 1
    @validation_opts.include? @value
  end
end