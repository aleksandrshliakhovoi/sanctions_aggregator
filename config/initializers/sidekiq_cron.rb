Rails.application.reloader.to_prepare do
  hash = {
     'hello_job' => {
     'class' => 'HelloWorldWorker',
     'cron'  => '1 * * * *'
    }
  }

  Sidekiq::Cron::Job.load_from_hash(hash) unless Rails.env.test?
  Sidekiq::Cron::Job.create(name: 'Save persons to Db - every day', cron: '*/1440 * * * *', class: 'UpdateProvidersWorker')
end