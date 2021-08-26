# Sanctions Aggregator

## The project requirements

Ruby 3.0.2
Postgres >= 9.2
NodeJS 14.7.4
Yarn 1.22.11

## Setup local environment

1. [Install Docker](https://docs.docker.com/get-docker/) on your PC
1. [Install NodeJS + Npm](https://nodejs.org/en/download/) on your PC
1. [Install Yarn](https://classic.yarnpkg.com/en/docs/install) on your PC
1. Clone the project repository:
   ```shell
   git clone git@gitlab.com:pivorak-orsc2021/group5/sanctions_aggregator.git && cd sanctions_aggregator
   ```
1. Install required gems:
   ```shell
   bundle install
   ```
1. Install required JS packages:
   ```shell
   yarn install
   ```
1. Create the project .env file:
   ```shell
   cp .env.dist .env
   ```
1. Update Postgres server configuration in the ```.env``` file (for local development environment update only ```DB_USER``` and ```DB_PASSWORD```)
1. Start Postgres and Elasticsearch instances using docker-compose:
   ```shell
   docker compose up
   ```
   to stop these instances you should run:
   ```shell
   docker compose down
   ```
1. Create database:
   ```shell
   bundle exec rails db:create
   ```
1. Run migrations:
   ```shell
   bundle exec rails db:migrate
   ```
1. Seed test data:
   ```shell
   bundle exec rails db:seed
   ```
1. Run local server:
   ```shell
   bundle exec rails s
   ```
1. Open [project](http://localhost:3000) in your browser

## Run linters 

1. Rubocop
   ```shell
   bundle exec rubocop
   ```
1. Brakeman
   ```shell
   bundle exec brakeman
   ```
1. Bundle-audit
   ```shell
   bundle-audit check --update
   ```
1. Bundle leak
   ```shell
   bundle leak check --update
   ```
1. Database_consistency
   ```shell
   bundle exec database_consistency
   ```

## Run tests

```shell
bundle exec rspec
```


## Lefthook
Link to gem
```link
https://github.com/evilmartians/lefthook repo
```
Syncing lefthook file
```shell
lefthook install 
```

Run manually lefthook
```shell
lefthook run pre-commit
```

## Services provided by Docker
1. Postgres (localhost:5432)
1. Elasticsearch (localhost:9200)
1. Kibana (localhost:5601)
1. Redis (localhost:6379)


## Sidekiq

Sidekiq
Link to gem
```link
https://github.com/mperham/sidekiq
```

install it in rails
```shell
bundle install
```

run sidekiq
```shell
bundle exec sidekiq
```

create worker 
```shell
rails generate sidekiq:worker test
```

checkout working sidekiq
```shell
rails c in your folder
write next command when it work
 "HelloWorldWorker.perform_async('easy')"
```
Redis working in Docker to install it in localsystem do next steps:
```shell
$ sudo add-apt-repository ppa:redislabs/redis
$ sudo apt-get update
$ sudo apt-get install redis
```

checkout redis
```shell
redis-server -v
```
## Providers

save individuals to db

```shell
rnbo = RnboProvider.new
rnbo.save_to_db(rnbo.validate_individuals)
```

save entity to db

```shell
ent = RnboEntityProvider.new
ent.save_to_db(ent.validate_entities)
```