require 'rails_helper'

RSpec.describe 'user/#index', type: :feature do
  before :each do
    @user = User.create(id: 1, name: 'Lilly', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg',
                        bio: 'my bio', posts_counter: 0)
    @post = Post.create(id: 1, title: 'Intro to JS', text: 'JavaScript is a problem solving language.',
                        comments_counter: 0, likes_counter: 0, author: @user)
    visit user_path(@user)
  end
  describe 'users show view' do
    it 'should show user profile picture' do
      expect(page).to have_content('Images')
    end
    it 'should show user username' do
      expect(page).to have_content(@user.name)
    end
    it 'should show the number of posts the user have written' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    it 'should show the user bio' do
      expect(page).to have_content 'Bio'
    end
    it 'should show the user first 3 posts' do
      posts = @user.recent_posts
      expect(posts.length).to be 1
    end
    it "should have button to view all user's post" do
      expect(page).to have_button('See all posts')
    end
    it "should redirect to user's post's index page" do
      click_link 'See all posts'
      expect(page).to have_button('Pagination')
    end
    it "should redirect to post's show page" do
      click_link 'See all posts'
      click_link 'Pagination'
      expect(page).to have_content(@post.text)
    end
  end
end
