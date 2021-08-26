# frozen_string_literal: true

class BaseProvider
  def save_to_db(validate_data)
    validate_data.each do |item|
      Person.create(item || nil)
    end
  end
end
