# frozen_string_literal: true

class BaseProvider
  attr_accessor :rnbo_sanction_persons

  def initialize
    @rnbo_sanction_persons = []
  end

  def save_to_db(validate_data)
    validate_data.each do |item|
      Person.create(item)
    end
  end
end
