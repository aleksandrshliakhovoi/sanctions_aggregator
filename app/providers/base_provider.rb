# frozen_string_literal: true

class BaseProvider
  def self.save_to_db (validate_data)
    validate_data.each do |item|
      Person.create(item)
    end
  end
end
