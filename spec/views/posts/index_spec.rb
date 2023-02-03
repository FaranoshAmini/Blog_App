require 'rails-helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg',
                                bio: 'my bio')
      @second_user = User.create(name: 'Farah',
                                 photo: 'https://img.freepik.com/free-vector/floral-card_53876-91231.jpg', bio: 'Doctor')
      @first_post = Post.create(author: @first_user, Title: 'Ruby', Text: '')
    end
  end
end
