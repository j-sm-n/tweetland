# Tweetland 

StackCommerce Code Challenge - Jasmin Hudacsek

[Heroku App](https://sc-tweetland.herokuapp.com/)

### App Design Choices

* Used `bcrypt` for user authentication to be more lightweight, but Devise would have probably taken me less time to configure.
* Used `twitter` gem for Twitter API management.
* Tried to keep controllers lean by building out a TwitterService, Tweet PORO and TwitterHelper to handle the redis cache store.
* Used redis to reduce load times for repeat queries.
* Attempted to use VCR and Webmock to stub out API feature tests but ran into an issue reported [here](https://github.com/vcr/vcr/issues/702).

### Prerequisites

What things you need to install the software and how to install them

```
Ruby 2.4.2
Rails 5.*
Redis server 3.2.5
Postgresql 9.*
```

### Installing

```
git clone git@github.com:j-sm-n/tweetland.git
bundle install
rails db:migrate
rails server
```

### Starting Redis server

In one terminal session, run:

```
redis-server
```

In another, run:
```
redis-cli monitor
```

## Running the tests

```
rspec
```
