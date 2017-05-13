class Project < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :user
  has_many :accounts, dependent: :destroy
end
