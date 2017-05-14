require 'custom_error'

class Account < ApplicationRecord
  REVIEW_SYNC_PAGES_COUNT = 2

  validates :uid, presence: true
  validates :kind, presence: true

  belongs_to :project
  has_many :reviews, dependent: :destroy

  enum kind: { android: 0, ios: 1, twitter: 2, facebook: 3, other: 4 }

  before_save :set_account_info


  def set_account_info
    info = if android?
      GooglePlayUtils.app_info(self)
    elsif twitter?
      twitter_client = TwitterUtils.new
      twitter_client.app_info(self)
    end

    self.name = info[:name]
    self.display_picture_url = info[:display_picture_url]
  end

  def sync_reviews(total_pages=REVIEW_SYNC_PAGES_COUNT)
    if android?
      (0..(total_pages-1)).each do |page|
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
