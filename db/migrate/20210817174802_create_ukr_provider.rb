class CreateUkrProvider < ActiveRecord::Migration[6.1]
  def change
    Provider.create name: 'Ukraine', url: 'https://sanctions-t.rnbo.gov.ua/'
  end
end
