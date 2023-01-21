require 'rails_helper'

RSpec.describe Like, type: :model do 
    it 'update_likes_counter should update likes_counter' do
        post = Post.create(title: 'First Post', comments_counter: 0, likes_counter: 0)
        likes = Like.create
        expect(post.likes_counter).to eq(1)
    end
end