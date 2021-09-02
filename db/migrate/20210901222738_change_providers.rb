class ChangeProviders < ActiveRecord::Migration[6.1]
  def up
    Provider.where(name: 'RNBO').update(name: 'RNBO (Private)')
  end

  def down
    Provider.where(name: 'RNBO (Private)').update(name: 'RNBO')
  end
end
