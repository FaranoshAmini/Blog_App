class Post < ApplicationRecord
  belongs_to :author, :class_name =>'User', foreign_key: :author_id
  has_many :likes
  has_many :comments
  after_save :post_counter_update

  def post_counter_update
    User.find_by_id(self.author_id).increment!(:posts_counter)
  end 
  
  def recent_comments
    Comment.where(post: self).order(updated_at: :desc).limit(5)
  end
end
