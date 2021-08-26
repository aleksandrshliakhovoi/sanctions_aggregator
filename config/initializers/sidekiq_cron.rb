Rails.application.reloader.to_prepare do
  hash = {
     'hello_job' => {
     'class' => 'HelloWorldWorker',
     'cron'  => '1 * * * *'
    }
  }

  Sidekiq::Cron::Job.load_from_hash(hash) unless Rails.env.test?
  Sidekiq::Cron::Job.create(name: 'Hard worker - every 1 min', cron: '*/1 * * * *', class: 'UpdateProvidersWorker')
end