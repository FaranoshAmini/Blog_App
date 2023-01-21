require 'rails_helper'
​
RSpec.describe Post, type: :model do
  it 'should be valid' do
    post = Post.create(title: nil)
    expect(post).to_not be_valid
  end
  ​
  it 'post_counter_update should update posts_counter' do
    user = User.create(name: 'Faranosh', posts_counter: 0)
    post = Post.create(author: user, title: 'First Post', comments_counter: 0, likes_counter: 0)
    expect(user.posts_counter).to eq(1)
  end
  ​
  it 'recent_comments should reutrn last comments' do
    user = User.create(name: 'Faranosh', posts_counter: 0)
    post = Post.create(author: user, title: 'First Post', comments_counter: 0, likes_counter: 0)
    comment = Comment.create(author: user, post:, text: 'first Comment!')
    expect(post.recent_comments).to include(comment)
  end
end
