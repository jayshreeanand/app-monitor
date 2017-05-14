class Project < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :issues, dependent: :destroy

  before_validation :set_slug

  def set_slug
    self.slug = name.strip.downcase.parameterize if name.present?
  end

  def primary_account
    return unless accounts.present?
    if accounts.android.present?
      accounts.android.first
    else
      accounts.first
    end
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
