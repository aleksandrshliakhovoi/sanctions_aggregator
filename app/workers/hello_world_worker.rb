# frozen_string_literal: true

class HelloWorldWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "Hello world"
  end
end
