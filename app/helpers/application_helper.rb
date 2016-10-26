module ApplicationHelper
  def merchant_only_button(wheretogo, button_words, button_power, path_parameter="")
    if session[:merchant_id]
      link_to send(wheretogo, path_parameter), method: button_power do
        "<div class=\"button\"><h4>#{button_words}</h4></div>".html_safe
      end
    end
  end

  def link_button(wheretogo, button_words, button_power, path_parameter="")
    link_to send(wheretogo, path_parameter), method: button_power do
      "<div class=\"button\"><h4>#{button_words}<h4></div>".html_safe
    end
  end
end
