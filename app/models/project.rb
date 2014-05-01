class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments, as: :commentable
end
