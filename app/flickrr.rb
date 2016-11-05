require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'

require_relative '../config/boot'

class Flickrr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions

  set :database_file, File.expand_path('../config/database.yml', __dir__)
  set :root,  File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }

  get '/' do
    redirect '/register'
  end
end

require_relative 'actions/register'
require_relative 'actions/gallery'
