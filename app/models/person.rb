# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :provider

  searchkick text_middle: [:first_name, :last_name], callbacks: false
end
