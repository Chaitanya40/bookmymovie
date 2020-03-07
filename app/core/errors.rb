class Errors
  def initialize
    @errors_array = []
  end
  
  def add(error_string)
    @errors << error_string
  end  
end  