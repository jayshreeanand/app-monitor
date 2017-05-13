class Issue < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :uid, presence: true, uniqueness: { scope: :project }
  validates :issue_url, presence: true
end
