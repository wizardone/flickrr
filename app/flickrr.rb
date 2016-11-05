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

  before '/gallery' do
    unless session[:user_id]
      redirect to('/')
    end
  end

  get '/' do
    # image paths
    # https://www.flickr.com/services/api/misc.urls.html
    @random_image_url = ::FlickrService
                        .new
                        .recent_photo
                        .url
    haml :main
  end
end
