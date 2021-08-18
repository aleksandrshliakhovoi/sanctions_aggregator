class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name, null: false, index: true
      t.string :url, null: false
      t.datetime :last_fetch_at

      t.timestamps
    end
  end
end
