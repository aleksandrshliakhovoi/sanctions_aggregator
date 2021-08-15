# frozen_string_literal: true

class Person < ApplicationRecord
  searchkick searchable: [:first_name, :last_name], filterable: [:first_name, :last_name], word_middle: [:first_name, :last_name]
end
