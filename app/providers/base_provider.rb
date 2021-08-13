# frozen_string_literal: true

require "net/http"

class BaseProvider
  def save_to_db (validate_data)
    Person.destroy_all

    validate_data.each do |person|
      Person.create(
        first_name:         person.first_name,
        last_name:          person.last_name,
        citizenship:        person.citizenship,
        birthday:           person.birthday,
        source_base:        person.source_base,
        end_sanctions_time: person.end_sanctions_time
      )
    end
  end
end



