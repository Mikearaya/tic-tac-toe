class CustomException < StandardError
  def display_error
    "\e[31m #{message} \e[0m"
  end
end
