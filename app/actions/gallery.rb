require 'will_paginate'
require 'will_paginate/array'
require 'byebug'
class Flickrr < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/search' do
    haml :search
  end

  get '/gallery' do
    if params[:search].try(:[], :text)
      search_query = params[:search][:text]
      @current_user.histories.create(data: search_query) unless params[:page]
      @photos ||= FlickrService.new.photos(text: search_query)
        .paginate(page: params[:page], per_page: Config::PAGINATION_PER_PAGE)

      haml :gallery
    else
      redirect to('/search')
    end
  end
end
