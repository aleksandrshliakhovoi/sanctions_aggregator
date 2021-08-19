class RemoveSourceBaseFromPeople < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :source_base
  end
end
