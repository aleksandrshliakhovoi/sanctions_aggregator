# frozen_string_literal: true

class AddAdditionalDeviseFeaturesToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      # ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      #
      # ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :users, :confirmation_token,   unique: true
  end
end
