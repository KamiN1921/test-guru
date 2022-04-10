module SessionHelper

  def flash_mes(flash)
    string = ''
    flash.each do |type, message|
      if message
        string += content_tag :div, message, class: "flash #{type}"
        string +='</br>'
      end
    end
    string.html_safe
  end
end
