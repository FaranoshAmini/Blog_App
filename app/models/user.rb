class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
 
  validates :Name, presence: true
  validates :Posts_Counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    Post.where(author: self).order(updated_at: :desc).limit(3)
  end
end
