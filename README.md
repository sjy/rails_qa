# DATA QA Rails Application

This is a Demo-wise Rails 7 app boost with Vite, scratched
from [rails-template](https://github.com/mattbrictson/rails-template).

## Features

### User Module

- Driven by `Devise` (sign in, sign out, session auth)
- Has two 2 Role
  - editor, view data records, can not modify data records directly.
  - reviewer, view and edit data records directly, able to review revision request form editors.
- Sample account:
  - editor: editor@example.com/password
  - reviewer: reviewer@example.com/password

### Data Records Module

- Define basic model via db schema and insert seed data with `db:seed`
- Add record via csv file, driven by `CSV` gem module to parse csv file, sample below

  | name      | value    |
      |-----------|----------|
  | alibaba   | 1000     |
  | jd        | 2000     |
  | bytedance | 9999 |
- Edit/delete by reviewer role users only.

### Date Record Revision

- Foreign keyed to `user.user_id` and `data_record.data_record_id`
- Only editors can create revision request (set `changed` field)
- Only reviewers can review revisions (able to update) and invoke `update_from_revision` on DataRecord Model
- Revision request records will be removed once referenced data record is deleted by some reviewer.

### Cached Query and View

- Using native cache feature, using memory cache as default channel.
- Fetch all data records from rails cache when possible.
- Deactivate data record cache via Sidekiq job asynly (when create/edit/delete data records)

### Permission Restriction

- Driven by `pundit`, asee `apps/controllers/application_controller.rb`
- Define method access control via policy, see `apps/policies/data_record_policy.rb`
- call `authorize @data_record` in need

## Prerequisites

This project requires:

* Ruby 3.1.4, preferably managed using [rbenv][https://github.com/rbenv/rbenv]
* Node and Yarn 1.x (`npm install -g yarn`), NVM is recommended
* PostgresSQL must be installed and accepting connections
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
