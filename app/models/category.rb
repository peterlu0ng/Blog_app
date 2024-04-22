class Category < ApplicationRecord
  has_many :blog_categories
  has_many :blogs, through: :blog_categories
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum:25}
end
