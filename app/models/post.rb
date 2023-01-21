class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments
  after_save :post_counter_update

  validates :Title, presence: true, length: { maximum: 250 }
  validates :PostsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { greater_than_or_equal_to: 0 }
  
  def post_counter_update
    User.find_by_id(author_id).increment!(:posts_counter)
  end

  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).limit(5)
  end
end
