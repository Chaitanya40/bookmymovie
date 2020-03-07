class SimpleCommand < Rectify::Command
  def errors
    @errors ||= Errors.new
  end    
end  