require 'google-play'

module GooglePlayUtils
  attr_accessor :client

  def self.fetch_reviews(account, page)
    client = ::GooglePlay.new
    reviews = client.reviews(account.uid, page: page)
    results = []
    reviews.each do |review|
      results << { account_id: account.id,
        uid: review.id,
        user: review.user,
        title: review.title,
        description: review.text,
        rating: review.rating,
        created_at: review.date }
    end
    results
  end
end
