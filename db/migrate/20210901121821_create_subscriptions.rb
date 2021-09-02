class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.references :followed_person

      t.boolean :has_events, default: false
    end
  end
end
