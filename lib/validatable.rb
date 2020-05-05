require_relative './custom_exception.rb'
module Validatable
  def self.exit_choice_valid?(choice)
    raise CustomException, 'Valid choice is (y or n) try again' unless choice.to_s.downcase.match?(/^[y|n]{1}$/)

    true
  end

  def self.valid_symbol?(symbol)
    unless symbol.match?(/^[\D]{1}$/)
      raise CustomException, "Invalid Symbol \n Valid Symbol is single none digit character\n Try Again"
    end

    true
  end

  def self.valid_name?(symbol)
    unless symbol.match?(/^.+$/)
      raise CustomException, "Invalid Name \n Valid name is one or more characters \n Try Again"
    end

    true
  end
end
