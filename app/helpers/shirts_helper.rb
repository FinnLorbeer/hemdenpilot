module ShirtsHelper
  
  def tidy_float(float)
    float.to_s.gsub(/(\.?0+$)/,"")
  end  
  
end
