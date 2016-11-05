class Picture
  attr_reader :params

  class << self
    def from_flickr(flickr_photo)
      new(id: flickr_photo['id'],
          secret: flickr_photo['secret'],
          farm_id: flickr_photo['farm'],
          server_id: flickr_photo['server'])
    end
  end

  def initialize(**params)
    @params = params
  end

  def url
    "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end

  private

  def id
    params[:id]
  end

  def farm_id
    params[:farm_id]
  end

  def server_id
    params[:server_id]
  end

  def secret
    params[:secret]
  end
end
