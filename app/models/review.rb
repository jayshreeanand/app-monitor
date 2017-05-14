class Review < ApplicationRecord
  self.record_timestamps = false

  belongs_to :account

  validates :description, presence: true
  validates :uid, presence: true, uniqueness: { scope: :account }

  def self.sync(params)

    review = Review.where(account_id: params[:account_id], uid: params[:uid]).first_or_initialize
    if params[:title].present?
      params[:text] = TranslationUtils.translate(params[:text])
    end

    if params[:description].present?
      params[:description] = TranslationUtils.translate(params[:description])
    end

    review.assign_attributes(
      title: params[:title],
      description: params[:description],
      created_at: params[:created_at],
      updated_at: params[:created_at],
      author: params[:author]
    )
    review.rating = params[:rating] if params[:rating].present?
    review.sentiment = params[:sentiment] if params[:sentiment].present?

    
    review.save! if review.new_record? || review.changed?
    review
  end
end
