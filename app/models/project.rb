class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments, as: :commentable

  enum status: [:pending, :ongoing, :completed, :canceled]
end
