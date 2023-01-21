require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'update_likes_counter should update likes_counter' do
    user = User.create(name: 'Faranosh', posts_counter: 0)
    post = Post.create(author: user, title: 'First Post', comments_counter: 0, likes_counter: 0)
    Like.create(author: user, post:)
    expect(post.likes_counter).to eq(1)
  end
end
