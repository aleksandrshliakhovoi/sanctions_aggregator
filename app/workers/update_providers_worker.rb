# frozen_string_literal: true

class UpdateProvidersWorker
  include Sidekiq::Worker

  def perform(*args)
    rnbo = RnboProvider.new
    rnbo.save_to_db(rnbo.validate_individuals)

    ent = RnboEntityProvider.new
    ent.save_to_db(ent.validate_entities)

    un_individual = UnIndividualProvider.new
    un_individual.save_to_db(un_individual.handle_data_from_xml)

    puts 'Data save to db'
  end
end
