class Account < ApplicationRecord
  validates :uid, presence: true
  validates :kind, presence: true
  
  belongs_to :project
  has_many :reviews, dependent: :destroy

  enum kind: { android: 0, ios: 1, twitter: 2, facebook: 3, other: 4 }
end
