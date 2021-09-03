class ChangeBrockenProviders < ActiveRecord::Migration[6.1]
  def up
    Provider.where(id: 1).update(name: 'RNBO (Individuals)')
    Provider.where(id: 2).update(name: 'RNBO (Entity)')
    Provider.where(id: 3).update(name: 'UN (Individuals)')
    Provider.where(id: 4).update(name: 'UN (Entity)')
    Provider.destroy(5)
  end

  def down
    Provider.where(id: 1).update(name: 'RNBO (Private)')
    Provider.where(id: 2).update(name: 'RNBO-entity')
    Provider.where(id: 3).update(name: 'UN-individuals')
    Provider.where(id: 4).update(name: 'UN-entity')
    Provider.create(id: 5, name: 'RNBO (Entity)', url: 'https://sanctions-t.rnbo.gov.ua/')
  end
end
