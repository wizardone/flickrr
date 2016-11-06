require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'

require_relative '../config/boot'
require_relative '../config/application'

class Flickrr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  set :database_file, File.expand_path('../config/database.yml', __dir__)
  set :root,  File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }

  enable :sessions

  before %r{/(gallery)|(search)} do
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect to('/') and return
    end
  end

  get '/' do
    @random_image_url = Picture.from_flickr(FlickrService.new.recent_photo).original_url
    haml :main
  end
end
