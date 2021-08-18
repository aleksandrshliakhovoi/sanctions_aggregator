# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :people

  validates :name, presence: true
  validates :url, presence: true
end
