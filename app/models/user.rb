class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :accounts, through: :projects
  has_many :issues, through: :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
