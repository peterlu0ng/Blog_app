class Blog < ApplicationRecord
  belongs_to :user
  has_many :blog_categories
  has_many :categories, through: :blog_categories
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :body, presence: true, length: {minimum: 10, maximum: 300}

end
