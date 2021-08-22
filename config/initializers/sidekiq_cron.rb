
hash = {
  'hello_job' => {
    'class' => 'HelloWorldWorker',
    'cron'  => '1 * * * *'
  }
}

Sidekiq::Cron::Job.load_from_hash hash