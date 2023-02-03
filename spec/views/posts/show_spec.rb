require 'rails_helper'

RSpec.describe 'user_post/#show', type: :feature do
  before :each do
    @user = User.create(name: 'Lilly', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg',
                        bio: 'my bio')
    @post = @user.posts.new('Title', 'Text and Description')
    visit user_post_path(@user.id, @post.id)
  end
  describe 'Users Posts show view' do
    it 'should show the post title' do
      expect(page).to have_content(@post.title)
    end
    it 'should show who wrote the post' do
      expect(page).to have_content("By #{@post.author.name}")
    end
    it 'should show how many comments the post has' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end
    it 'should show how many likes the post has' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end
    it 'should show the post body' do
      expect(page).to have_content(@post.text)
    end
    it 'should show the username of each commentor' do
      @post.comments.each { |comment| expect(page).to have_content(comment.author.name) }
    end
    it 'should show the comment of each commentor' do
      @post.comments.each { |comment| expect(page).to have_content(comment.text) }
    end
  end
end
