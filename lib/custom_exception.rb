require 'colorize'
class CustomException < StandardError
  def display_error
    message.red.bold
  end
end
