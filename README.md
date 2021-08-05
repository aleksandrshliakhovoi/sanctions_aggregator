# Sanctions Aggregator

## The project requirements

Ruby 3.0.2
Postgres >= 9

## Setup local environment

1. [Install Postgres](https://www.postgresqltutorial.com/install-postgresql) on your PC
1. Clone the project repository:
```git@gitlab.com:pivorak-orsc2021/group5/sanctions_aggregator.git ```
1. Install required gems: ```bundle install```
1. Create the project .env file: ```cp .env.dist .env```
1. Update postgres server configuration in the ```.env``` file
1. Create database: ```bundle exec rails db:create```
1. Run migrations: ```bundle exec rails db:migrate```
1. Run local server: ```bundle exec rails s```
1. Open [project](http://localhost:3000) in your browser

## Run linters 

1. ```bundle exec rubocop```
1. ```bundle exec brakeman```
1. ```bundle-audit check --update```
1. ```bundle leak check --update```
1. ```bundle exec database_consistency```

## Run tests

```bundle exec rspec```
