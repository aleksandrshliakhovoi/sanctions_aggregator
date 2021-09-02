class CreateAdditionalProviders < ActiveRecord::Migration[6.1]
  def change
    Provider.create name: 'RNBO-entity',    url: 'https://sanctions-t.rnbo.gov.ua/'
    Provider.create name: 'UN-individuals', url: 'https://scsanctions.un.org/378j9en-all.html#alqaedaent'
    Provider.create name: 'UN-entity',      url: 'https://scsanctions.un.org/378j9en-all.html#alqaedaent'
  end
end
