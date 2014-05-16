class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments, as: :commentable, dependent: :destroy

  enum status: [:pending, :ongoing, :completed, :canceled]

  has_and_belongs_to_many :users
end
