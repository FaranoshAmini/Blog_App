require 'rails_helper'

RSpec.describe 'Users index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @first_user = User.create(name: 'Lilly', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg',
                                bio: 'my bio')
      @second_user = User.create(name: 'Farah',
                                 photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg', bio: 'Doctor')
      @users = User.all
    end
    it 'Display  username of all user\'s' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'Display the profile picture for each user' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
    it 'Display the number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts.count}")
      end
    end
    it 'redirects to the user show page' do
      visit users_path 
      click_link('Lilly', match: :prefer_exact)
      expect(page).to have_content('Bio:')
    end
  end
end
