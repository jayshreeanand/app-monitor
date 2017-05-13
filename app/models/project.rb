class Project < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  has_many :accounts, dependent: :destroy
end
