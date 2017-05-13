require 'google-play'

module GooglePlayUtils
  attr_accessor :client

  def self.fetch_reviews(app_name, page)
    client = ::GooglePlay.new
    reviews = client.reviews(app_name, page: page)
    byebug
  end
end
