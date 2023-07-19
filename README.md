# DATA QA Rails Application

This is a Rails 7 app boost with Vite, scratched
from [rails-template](https://github.com/mattbrictson/rails-template).

## Documentation

This README describes the purpose of this repository and how to set up a development environment.

<!-- Links to additional project documentation can go here. -->

## Prerequisites

This project requires:

* Ruby 3.1.4, preferably managed using [rbenv][]
* Node and Yarn 1.x (`npm install -g yarn`), NVM is recommended
* PostgreSQL must be installed and accepting connections
* Redis Server must be installed

On a Mac, you can obtain all of the above packages using [Homebrew][].

## Getting started

### bin/setup

Run the `bin/setup` script. This script will:

* Install dependencies using Bundler and Yarn
  * `bundle install`
  * `yarn install`
  * other preset script
* Create a `.env.development` file
* Create, migrate, and seed the database (by default, localhost:5432)

### Run it!

Start the app with `yarn dev`.

The app will be located at <http://127.0.0.1:5000/>.

## Development

To run the full suite of tests and lint checks, run:

```
$ bin/rake
```

To auto-correct formatting and linting issues, run:

```
$ bin/rake fix
```

## Deployment

Ensure the following environment variables are set in the deployment environment:

* `DATABASE_URL`
* `RACK_ENV`
* `RAILS_ENV`
* `SECRET_KEY_BASE`

Optionally:

* `BASIC_AUTH_PASSWORD`
* `BASIC_AUTH_USERNAME`
* `POSTMARK_API_KEY`
* `RAILS_DISABLE_SSL`
* `RAILS_HOSTNAME`
* `RAILS_LOG_TO_STDOUT`
* `RAILS_MAX_THREADS`
* `RAILS_SERVE_STATIC_FILES`
* `REDIS_URL`
* `SIDEKIQ_CONCURRENCY`
* `SIDEKIQ_WEB_PASSWORD`
* `SIDEKIQ_WEB_USERNAME`
* `WEB_CONCURRENCY`

[rbenv]:https://github.com/sstephenson/rbenv

[Homebrew]:http://brew.sh
