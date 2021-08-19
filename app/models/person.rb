# frozen_string_literal: true

class Person < ApplicationRecord
<<<<<<< HEAD
  belongs_to :provider

  searchkick text_middle: [:first_name, :last_name], callbacks: false
=======
  searchkick text_middle: [:first_name, :last_name]
>>>>>>> fix typos
end
