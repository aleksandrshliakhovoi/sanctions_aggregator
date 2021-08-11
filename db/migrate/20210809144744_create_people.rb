class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :citizenship
      t.string :source_base
      t.date :end_sanctions_time

      t.timestamps
    end
  end
end
