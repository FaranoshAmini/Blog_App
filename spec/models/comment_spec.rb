require 'rails_helper'

RSpec.describe Comment, type: :model do 
    it 'update_comment_counter should update comments_counter' do
        post = Post.create(title: 'First Post', comments_counter: 0, likes_counter: 0)
        comment = Comment.create(text: 'first Comment!')
        expect(post.comments_counter).to eq(1)
    end
end