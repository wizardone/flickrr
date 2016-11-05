require 'sinatra/base'
require 'sinatra/activerecord'

class Flickrr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database_file, 'config/database.yml'

  get '/' do
    'wat?'
  end
end

require_relative 'actions/register'
require_relative 'actions/gallery'
