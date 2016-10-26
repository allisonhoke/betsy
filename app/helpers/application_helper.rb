module ApplicationHelper
  def merchant_only_button(wheretogo, button_words, button_power=:get)
    if session[:merchant_id]
      link_to new_category_path, method: button_power do
        "<div class=\"button\">#{button_words}</div>".html_safe
      end
    end
  end

  # solution from http://stackoverflow.com/questions/7461290/convert-cents-into-dollar-string-in-ruby-without-use-of-bigdecimal
  def add_decimal(cents)
    pfx = [ '0.00', '0.0', '0.' ]
    if(pfx[cents.to_s.length])
      cents = pfx[cents.to_s.length] + cents.to_s
    else
      cents = cents.to_s.dup
      cents[-2, 0] = '.'
    end
    return cents
  end
end
