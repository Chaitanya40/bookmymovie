class SimpleCommand < Rectify::Command
  attr_accessor :errors
  def initialize(*args)
    super(*args)
    @errors = Errors.new
  end  
end  