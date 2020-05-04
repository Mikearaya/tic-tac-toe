require_relative './custom_exception.rb'
module Validatable
  def self.exit_choice_valid?(choice)
    raise CustomException, 'Valid choice is (y or n) try again' unless choice.to_s.downcase.match(/^[y|n]{1}$/)

    true
  end

  def self.valid_symbole?(symbole)
    unless symbole.match(/^[\D]{1}$/)
      raise CustomException, "Invalid Symbole \n Valid Symbole is single none digit characted\n Try Again"
    end

    true
  end
end
