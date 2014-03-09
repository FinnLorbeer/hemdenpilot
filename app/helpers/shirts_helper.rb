module ShirtsHelper

  def tidy_float(float)
    float.to_s.gsub(/(\.?0+$)/,"")
  end

  def link_to_label(shirt)
    if shirt.affiliate == ''
      shirt.link
    else
      shirt.affiliate
    end
  end

end
