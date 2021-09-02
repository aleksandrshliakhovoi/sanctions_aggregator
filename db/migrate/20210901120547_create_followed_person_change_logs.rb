class CreateFollowedPersonChangeLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :followed_person_change_logs do |t|
      t.references :followed_person
      t.integer :action
      t.text :details

      t.timestamps
    end
  end
end
