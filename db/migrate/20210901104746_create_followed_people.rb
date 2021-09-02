class CreateFollowedPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :followed_people do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday, null: true

      t.text :providers, array: true, default: []
      t.string :citizenship
      t.date :end_sanctions_time

      t.integer :matching_people

      t.timestamps
    end
  end
end
