module ApplicationHelper
  def merchant_only_button(wheretogo, button_words, button_power=:get)
    if session[:merchant_id]
      link_to new_category_path, method: button_power do
        "<div class=\"button\">#{button_words}</div>".html_safe
      end
    end
  end
end
