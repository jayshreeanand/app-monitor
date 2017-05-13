class Project < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :issues, dependent: :destroy

  before_save :set_slug

  def set_slug
    self.slug = slug.strip.downcase.parameterize if slug.present?
  end

  def sync_issues
    return unless trello_board_uid.present?
    trello_client = TrelloUtils.new
    remote_issues = trello_client.fetch_cards(self)
    remote_issues.each do |remote_issue|
      Issue.sync(remote_issue)
    end
    issues
  end
end
