require 'custom_error'

class Account < ApplicationRecord
  REVIEW_SYNC_PAGES_COUNT = 2

  validates :uid, presence: true
  validates :kind, presence: true

  belongs_to :project
  has_many :reviews, dependent: :destroy

  enum kind: { android: 0, ios: 1, twitter: 2, facebook: 3, other: 4 }

  def sync_reviews
    if android?
      (0..(REVIEW_SYNC_PAGES_COUNT-1)).each do |page|
        begin
          remote_reviews = GooglePlayUtils.fetch_reviews(self, page)
        rescue Errors::CustomError => e
          return reviews # stop syncing reviews
        end
        remote_reviews.each do |remote_review|
          Review.sync(remote_review)
        end
      end
      reviews
    elsif twitter?
      twitter_client = TwitterUtils.new
      remote_reviews = twitter_client.fetch_mentions(self)
      remote_reviews.each do |remote_review|
        Review.sync(remote_review)
      end
    end
  end
end
