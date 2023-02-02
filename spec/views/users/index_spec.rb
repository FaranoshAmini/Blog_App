require 'rails_helper'

RSpec.describe 'Users index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg', bio: 'my bio')
      @second_user = User.create(name: 'Farah', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg', bio: 'Doctor')
      @users = User.all
    end
    it  'Display  username of all user\'s' do
      @users.each do |user|
      expect(page).to have_content(user.name)
      end 
    it 'Display the profile picture for each user' do
     @users.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
     end  
      
    end
  end
end