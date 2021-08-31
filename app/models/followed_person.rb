# frozen_string_literal: true

class FollowedPerson < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :followed_person_change_logs
end
