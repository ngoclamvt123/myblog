class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, length: { minimum: 3 }
  validates :content, presence: true

  def self.search(search)
    if search
      where('title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
