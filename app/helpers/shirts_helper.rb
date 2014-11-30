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

  def get_param(field)
    if field == :label
      params[:label].to_s.sub("{\"id\"=>\"", "").chomp("\"}")
    else
      params[field].to_i
    end
  end

  def find_applicable_params(collar, bust, waist, arm, label)
    param = {}
    param[:size_collar] = collar unless collar == 0
    param[:size_bust] =  bust unless bust == 0
    param[:size_waist] = waist unless waist == 0
    param[:size_arm] =  arm unless arm == 0
    param[:label] = label unless label == ''
    param
  end

end
