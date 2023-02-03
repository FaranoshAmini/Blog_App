require 'rails_helper'

RSpec.describe 'user/#index', type: :feature do
  before :each do
    @user = User.create(name: 'Lilly', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg',
      bio: 'my bio')
    visit user_path(@user.id)
  end
  describe 'users show view' do
    it 'should show user profile picture' do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'should show user username' do
      expect(page).to have_content(@user.name)
    end
    it 'should show the number of posts the user have written' do
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end
    it 'should show the user bio' do
      expect(page).to have_content 'Bio'
    end
    it 'should show the user first 3 posts' do
      @user.last_three_posts.each { |post| expect(page).to have_content(post.title) }
    end
    it "should have button to view all user's post" do
      expect(page).to have_button('See all posts')
    end
    it "should redirect to post's show page" do
      post = @user.posts.first

      find("a[href='#{user_post_path(@user.id, post.id)}']").click
      expect(current_path).to match user_post_path(@user.id, post.id)
    end
    it "should redirect to user's post's index page" do
      find("a[href='#{user_posts_path(@user.id)}']").click
      expect(current_path).to match user_posts_path(@user.id)
    end
  end
end
