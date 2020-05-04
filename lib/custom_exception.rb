require 'colorize'
class CustomException < StandardError
  def display_error
    message.red.on_white.bold
  end
end
