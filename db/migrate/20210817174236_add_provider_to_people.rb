class AddProviderToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :provider_id, :integer
  end
end
