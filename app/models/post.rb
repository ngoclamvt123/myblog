class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, length: { minimum: 3 }
  validates :content, presence: true
end
