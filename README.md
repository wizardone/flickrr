# flickrr

[![Build Status](https://travis-ci.org/wizardone/flickrr.svg?branch=master)](https://travis-ci.org/wizardone/flickrr)
[![codecov](https://codecov.io/gh/wizardone/flickrr/branch/master/graph/badge.svg)](https://codecov.io/gh/wizardone/flickrr)

A small app intended to retrieve and visualize data from Flickr. Build
as a coding challenge. Build for about a total of *10-12 hours*
It is deployed on Heroku, you can access it: [here](https://flickrr.herokuapp.com/).
Please note that there is no typo in the name, it is simply called
*flickrr*. 99% of it is coded manually, without any external libraries.

I sincerely hope it is not judged by its looks, because I don't stand a
chance :)

### Technologies used
- Ruby
- PostgreSql
- Haml

### Libraries used
- Sinatra
  - Extremely lightweight web framework written in Ruby, alternative of
Rails.
- Flickr
  - A thin wrapper around the Flickr API. Pretty much all it does is
forward the http requests.
- Will paginate
  - Paginating library.

### Specs
The project uses [TravisCI](https://travis-ci.org/wizardone/flickrr), information about the spec suite can be found
by clicking on the green (well, I hope it is green) build status icon.

### Code coverage
Code coverage is provided by [codecov.io](https://codecov.io/gh/wizardone/flickrr)

### Application specifics

The app saves the last 10 searches of the user in order.
The login/registration forms are extremely lightweight, there is no deep
login involved.
The main page shows the last public picture on Flickr, no matter whether
someone is logged in or not.

### Install locally
In case anybody actually wants to use this on his local machine there is
some setup to be done:

1. Install ruby 2.3.0. A good way to do so will be with [rbenv](https://github.com/rbenv/rbenv)
2. Install [rubygems](https://rubygems.org/pages/download). Rubygems is
   a package management network.
3. Install *bundler* with `gem install bundler`
4. Clone this repository
5. Run `bundle`. If you set up everything correctly this should install
   all the dependencies of the project.
6. Create the database and run the migrations: `rake db:create && rake
   db:migrate`. Prefix with `bundle exec` if you have multiple versions
   of ruby
7. From within the project run `rackup` or `bundle exec rackup` if you
   have multiple versions of ruby
8. The project should be available on `http://localhost:9292`
9. To run the specs locally first ensure you have the test database
   setup: `RACK_ENV=test rake db:create && rake db:migrate`. Then run
`rspec spec/`. Again, prefix the command with `bundle exec` if you need
to

### Compromises
- Generally I would like to code everything from scratch, however I did
not have enough time to code a custom pagination
- Only a very basic styling is applied, I am not into CSS, but if I had
  more time I would try and search for some better looking solutions
