class CreateRnboEntityProvider < ActiveRecord::Migration[6.1]
  def up
    Provider.create name: 'RNBO (Entity)', url: 'https://sanctions-t.rnbo.gov.ua/'
  end

  def down
    Provider.where(name: 'RNBO (Entity)').destroy_all
  end
end
