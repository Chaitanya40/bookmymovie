class Errors
  def initialize
    @errors_array = []
  end
  
  def add(error_hash)
    @errors << error_hash
  end
  
  def all
    @errors_array
  end  
end  