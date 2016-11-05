require 'flickr.rb'
class FlickrService
  attr_reader :flickr

  def initialize
    @flickr = Flickr.new(ENV['FLICKR_API_KEY'])
  end

  # { text: 'bulgaria' }
  def photos(criteria = {})
    flickr.photos(criteria)
  end

  def recent_photo
    flickr.recent.first
  end
end
