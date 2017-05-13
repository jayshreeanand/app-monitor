class Project < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :user
  has_many :accounts, dependent: :destroy

  before_save :set_slug

  def slug
    self.slug = slug.strip.downcase.parameterize if slug.present?
  end
end
