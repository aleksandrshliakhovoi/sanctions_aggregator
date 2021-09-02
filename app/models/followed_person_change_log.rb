# frozen_string_literal: true

class FollowedPersonChangeLog < ApplicationRecord
  enum action: {
    added: 'The person has been added to the database',
    removed: 'The person has been removed from the database',
    changed_citizenship: 'The person citizenship has been changed',
    changed_sanctions_end_date: 'The person sanctions end date has been changed'
  }
end
