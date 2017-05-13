class Issue < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :uid, presence: true, uniqueness: { scope: :project }
  validates :issue_url, presence: true

  def self.sync(params)
    issue = Issue.where(project_id: params[:project_id], uid: params[:uid]).first_or_initialize
    issue.assign_attributes(
      title: params[:title],
      description: params[:description],
    )
    issue.issue_url = params[:issue_url] if params[:issue_url].present?

    issue.save! if issue.new_record? || issue.changed?
    issue
  end
end
