# Sanctions Aggregator

## The project requirements

Ruby 3.0.2
Postgres >= 9

## Setup local environment

1. [Install Docker](https://docs.docker.com/get-docker/) on your PC
1. Clone the project repository:
   ```shell
   git clone git@gitlab.com:pivorak-orsc2021/group5/sanctions_aggregator.git && cd sanctions_aggregator
   ```
1. Install required gems:
    ```shell
    bundle install
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