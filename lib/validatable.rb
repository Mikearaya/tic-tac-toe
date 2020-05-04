require_relative './custom_exception.rb'
module Validatable
  def self.exit_choice_valid(choice)
    raise CustomException, 'Valid choice is (y or n) try again' unless choice.to_s.downcase.match(/^[y|n]{1}$/)

    true
  end
end
