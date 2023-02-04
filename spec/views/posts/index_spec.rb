require 'rails_helper'

RSpec.describe 'Posts index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user = User.create(name: 'Farah', photo: 'img.jpg', bio: 'Developer', posts_counter: 0)
      @post = Post.create(title: 'Intro to JS', text: 'Full Stack Development', comments_counter: 0, likes_counter: 0,
                          author: @user)
      @comment = Comment.create(text: 'Awesome', author: @user, post: @post)
      visit user_posts_path(@user)
    end
    it 'Display the user\'s profile picture' do
      expect(page).to have_content('Images')
    end
    it 'Display the user\'s username' do
      expect(page).to have_content(@user.name.to_s)
    end
    it 'Display the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    it 'Display a post\'s title' do
      expect(page).to have_content(@post.title.to_s)
    end
    it 'Display the some of the post\'s body' do
      expect(page).to have_content(@post.text[0 - 30].to_s)
    end
    it 'Display the first comments on a post' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@comment.text.to_s)
    end
    it 'Display how many comments a post has' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end
    it 'Display how many likes a post has' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end
    it 'Display a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end
    it 'can click on a post, it redirects me to that post\'s show page' do
      expect("#{page.current_url}/#{@post.id}").to match user_post_path(@user.id, @post.id)
    end
  end
end
