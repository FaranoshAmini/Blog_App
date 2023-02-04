require 'rails_helper'

RSpec.describe 'Users index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(id: 1, name: 'Farah', photo: 'img.jpg', bio: 'Developer', posts_counter: 0)
      visit users_path
    end
    it 'Display  username of all user\'s' do
      expect(page).to have_content('Farah')
    end
    it 'Display the profile picture for each user' do
      expect(page).to have_css("img[src*='img.jpg']")
    end
    it 'Display the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 0')
    end
    it 'redirects to the user show page' do
      click_link('Farah', match: :prefer_exact)
      expect(page).to have_content('Bio:')
    end
  end
end
