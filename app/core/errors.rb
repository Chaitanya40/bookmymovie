class Errors
  def initialize
    @errors_array = []
  end
  
  def add(error_hash)
    @errors_array << error_hash
  end
  
  def all
    @errors_array
  end  
end  