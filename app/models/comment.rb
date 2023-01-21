class Comment < ApplicationRecord
  belongs_to :author, :class_name =>'User', foreign_key: :author_id
  belongs_to :post
  after_save :update_comment_counter

  def update_comment_counter
    Post.find_by_id(self.post_id).increment!(:comments_counter)
  end  
end    
