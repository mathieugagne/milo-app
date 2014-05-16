class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments, as: :commentable, dependent: :destroy

  enum status: [:pending, :ongoing, :completed, :canceled]

  has_and_belongs_to_many :users

  searchable do
    text :title, :description, :status
    text :comments do
      comments.map(&:text).join(' ')
    end
    text :assignees do
      users.map(&:email).join(' ')
    end
    string :title
    string :description
    string :status
    integer :comments_count
  end
end
