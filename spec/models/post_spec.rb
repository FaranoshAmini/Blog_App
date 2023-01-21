require 'rails_helper'

RSpec.describe Post, type: :model do 
    it 'should be valid' do 
        post = Post.create(title: nil)
        expect(post).to_not be_valid
    end

    it 'post_counter_update should update posts_counter' do
        user = User.create(name: 'Faranosh')
        post = Post.create(author: user, title: 'First Post', comments_counter: 0, likes_counter: 0)
        post.post_counter_update
        expect(user.posts_counter).to eq(1)
    end

    it 'recent_comments should reutrn last comments' do
        post = Post.create(title: 'First Post', comments_counter: 0, likes_counter: 0)
        comment = Comment.create(text: 'first Comment!')
        expect(user.recent_comments).to include(comment)
    end
end