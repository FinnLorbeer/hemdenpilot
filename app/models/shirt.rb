class Shirt < ActiveRecord::Base

  def to_param
    code
  end
  
end
