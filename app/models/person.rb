# frozen_string_literal: true

class Person < ApplicationRecord
  searchkick text_middle: [:first_name, :last_name]
end
