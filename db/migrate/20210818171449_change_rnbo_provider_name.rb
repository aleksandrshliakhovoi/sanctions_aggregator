class ChangeRnboProviderName < ActiveRecord::Migration[6.1]
  def up
    Provider.where(name: 'Ukraine').update(name: 'RNBO')
  end

  def down
    Provider.where(name: 'RNBO').update(name: 'Ukraine')
  end
end
