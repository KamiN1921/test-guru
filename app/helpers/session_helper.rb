module SessionHelper

  def flash_mes(message)
    content_tag :p, message, class: 'flash alert' if message
  end
end
