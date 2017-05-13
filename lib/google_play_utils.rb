require 'google-play'

module GooglePlayUtils
  attr_accessor :client

  def self.fetch_reviews(account, page)
    begin
      client = ::GooglePlay.new
      reviews = client.reviews(account.uid, page: page)
      results = []
      reviews.each do |review|
        results << { account_id: account.id,
          uid: review.id,
          user: review.user,
          title: review.title,
          description: review.text.sub('  Full Review',''),
          rating: review.rating,
          created_at: review.date }
      end
      results

    rescue GooglePlay::App::NotFoundError => e
      raise Errors::CustomError, 'Reached end of reviews or app not found'
    end
  end

  def self.app_info(account)
    client = ::GooglePlay.new
    details = client.app(account.uid)
    app_image_url = if details.image_url.start_with? '//'
      details.image_url.sub('//','https://')
    else
      details.image_url
    end
    { name: details.name, display_picture_url: app_image_url }
  end
end
