class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :body, presence: true, length: {minimum: 10, maximum: 300}

end
