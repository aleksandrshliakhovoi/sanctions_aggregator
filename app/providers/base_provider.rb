# frozen_string_literal: true

class BaseProvider
  def save_to_db(validate_data)
    Person.where(provider_id: validate_data.first['provider_id']).destroy_all
    validate_data.each do |item|
      Person.create(item || nil)
    end
  end
end
