require 'will_paginate'
require 'will_paginate/array'
require 'byebug'
class Flickrr < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/search' do
    haml :search
  end
end
