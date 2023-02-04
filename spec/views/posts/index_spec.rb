require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/200',
                                bio: 'my bio')
      @second_user = User.create(name: 'Farah',
                                 photo: 'https://picsum.photos/200', bio: 'Doctor')
      @first_post = Post.create(author: @first_user, Title: 'Ruby', Text: 'This is my first post')
      @second_post = Post.create(author: @second_user, Title: 'Rails', Text: 'This is my second post')
      comment.create(post: @first_post, author: @first_user, Text: 'Great job')
      comment.create(post: @first_post, author: @first_user, Text: 'Interesting')
      comment.create(post: @first_post, author: @first_user, Text: 'Amazing')
      @user = User.all
      visit user_post_path(@first_user.id)
    end
    it 'Display the user\'s profile picture' do
      expect(page).to have_css("img[src*=#{@first_user.photo}']")
    end
    it 'Display the user\'s username' do
      expect(page).to have_content(@first_user.name.to_s)
    end
    it 'Display the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@first_user.post_counter}")
    end
    it 'Display a post\'s title' do
      expect(page).to have_content(@first_post.title.to_s)
    end
    it 'Display the some of the post\'s body' do
      expect(page).to have_content(@first_post.text[0 - 30].to_s)
    end
    it 'Display the first comments on a post' do
      expect(page).to have_content(@first_post.comments.last.text.to_s)
    end
    it 'Display how many comments a post has' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end
    it 'Display how many likes a post has' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end
    it 'Display a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('pagination')
    end
    it 'can click on a post, it redirects me to that post\'s show page' do
      expect("#{page.current_url}/#{@first_post.id}").to match user_post_path(@first_user.id, @first_post.id)
    end
  end
end
