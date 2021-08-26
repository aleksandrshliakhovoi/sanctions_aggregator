# frozen_string_literal: true

class UpdateProvidersWorker
  include Sidekiq::Worker

  def perform(*args)
    # rnbo = RnboProvider.new
    # rnbo.save_to_db(rnbo.validate_individuals)

    # ent = RnboEntityProvider.new
    # ent.save_to_db(ent.validate_entities)
    puts 'Hello world motherfucker'
  end
end
