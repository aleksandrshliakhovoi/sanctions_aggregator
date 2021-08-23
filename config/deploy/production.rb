# frozen_string_literal: true

server '65.21.245.222',
       user: 'group5',
       roles: %w[app db web]
set :rbenv_type, :user
set :rbenv_ruby, '3.0.2'
set :project_name, 'sanctions_aggregator'
set :branch, 'develop'
set :deploy_to, '/home/group5/sanctions_aggregator/site/'
set :normalize_asset_timestamps,
    %w[public/images public/javascripts public/stylesheets]
set :keep_assets, 2

append :linked_dirs, 'public/seed_images', 'storage'

set :stage,             'production'
set :shared_path,       "#{fetch(:deploy_to)}/shared"
set :socket_path,       "#{fetch(:shared_path)}/tmp/sockets"
set :puma_sock,         "unix://#{fetch(:socket_path)}/puma-group51.sock"
set :puma_control,      "unix://#{fetch(:socket_path)}/pumactl.sock"
set :puma_state,        "#{fetch(:socket_path)}/puma.state"
set :puma_log,          "#{fetch(:socket_path)}/log/puma-#{fetch(:stage)}.log"
set :stage_log,         "#{fetch(:socket_path)}/log/#{fetch(:stage)}.log"
set :puma_service_name, 'puma-group5'
set :sidekick_service,  'sidekiq-group5'

namespace :deploy do
  before 'starting', 'deploy:source_env'
  after 'deploy:finished', 'puma:restart'
  after 'deploy:finished', 'sidekiq:restart'

  desc 'load env vars into session'
  task :source_env do
    on roles(:app) do
      execute 'source ~/.profile'
      execute 'source ~/.bashrc'
    end
  end
end
